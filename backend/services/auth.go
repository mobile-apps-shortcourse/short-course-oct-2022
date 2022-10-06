package services

import (
	"context"
	"fmt"
	"os"
	"strings"

	pb "crowder.com/generated"
	"crowder.com/utils"
	cloud "github.com/cloudinary/cloudinary-go"
	"github.com/cloudinary/cloudinary-go/api/uploader"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
)

// AuthSvcServer => grpc server implementation
type AuthSvcServer struct {
	pb.UnimplementedAuthSvcServer
}

// CreateUser
// creates a new user account
func (s *AuthSvcServer) CreateUser(ctx context.Context, request *pb.CrowderUser) (*pb.AuthResponse, error) {
	response := &pb.AuthResponse{}
	var decodedUser pb.CrowderUser

	// check if user account already exists
	if err := utils.AccountCol.FindOne(ctx, bson.D{{Key: "username", Value: request.GetUsername()}}).Decode(&decodedUser); err != nil {
		// user does not exist, create new account
		// assign unique id
		request.Id = primitive.NewObjectID().Hex()
		// secure password & update request
		salt, encoded := utils.EncodePassword(request.GetPassword())
		request.Salt = *salt
		request.Password = *encoded

		// if avatar does not start with http/https, perform upload to cloudinary
		if !strings.HasPrefix(request.GetAvatar(), "http") {
			cld, _ := cloud.NewFromParams(os.Getenv("CLOUDINARY_CLOUD_NAME"),
				os.Getenv("CLOUDINARY_API_KEY"), os.Getenv("CLOUDINARY_SECRET"))
			encoded := fmt.Sprintf("data:image/png;base64,%s", request.GetAvatar())
			resp, uploadErr := cld.Upload.Upload(ctx, encoded,
				uploader.UploadParams{PublicID: fmt.Sprintf("%v_avatar", request.GetId()),
					Folder: os.Getenv("CLOUDINARY_FOLDER_NAME")})
			if uploadErr != nil {
				return response, uploadErr
			}
			// update avatar url
			request.Avatar = resp.SecureURL
		}

		// insert into database
		result, err := utils.AccountCol.InsertOne(context.Background(), &request)

		if err != nil {
			fmt.Println(err)
			response.Message = err.Error()
		} else {
			fmt.Printf("account created with database ref => %v", result.InsertedID)
			response.Message = "Account created successfully"
			response.User = request
			response.Successful = true
		}
	} else {
		fmt.Println(err)
		response.Message = "Account already exists. Please login instead"
	}

	return response, nil
}

// Login
// sign in existing users
func (s *AuthSvcServer) Login(ctx context.Context, request *pb.LoginRequest) (*pb.AuthResponse, error) {
	response := &pb.AuthResponse{}
	var decodedUser pb.CrowderUser

	// check if user account already exists
	if err := utils.AccountCol.FindOne(ctx, bson.D{{Key: "username", Value: request.GetUsername()}}).Decode(&decodedUser); err == nil {

		// validate password
		if *utils.ValidatePasswords(request.GetPassword(), decodedUser.GetPassword(), decodedUser.GetSalt()) {
			response.Message = "Login successful"
			response.Successful = true
			response.User = &decodedUser
		} else {
			fmt.Println("Password mismatch")
			response.Message = "Login failed. Please try again"
		}
	} else {
		fmt.Println(err)
		response.Message = "Login failed. Please try again"
	}
	return response, nil
}

// UpdateUser
// update user account
func (s *AuthSvcServer) UpdateUser(ctx context.Context, request *pb.CrowderUser) (*pb.CrowderUser, error) {
	var decodedUser pb.CrowderUser

	// check if user account already exists
	if err := utils.AccountCol.FindOne(ctx, bson.D{{Key: "username", Value: request.GetUsername()}, {Key: "password", Value: request.GetPassword()}}).Decode(&decodedUser); err == nil {

		// update props
		decodedUser.Bio = request.GetBio()
		decodedUser.DisplayName = request.GetDisplayName()
		decodedUser.Status = request.GetStatus()
		decodedUser.Type = request.GetType()

		// if avatar does not start with http/https, perform upload to cloudinary
		if !strings.HasPrefix(request.GetAvatar(), "http") {
			cld, _ := cloud.NewFromParams(os.Getenv("CLOUDINARY_CLOUD_NAME"),
				os.Getenv("CLOUDINARY_API_KEY"), os.Getenv("CLOUDINARY_SECRET"))
			encoded := fmt.Sprintf("data:image/png;base64,%s", request.GetAvatar())
			resp, uploadErr := cld.Upload.Upload(ctx, encoded,
				uploader.UploadParams{PublicID: fmt.Sprintf("%v_avatar", request.GetId()),
					Folder: os.Getenv("CLOUDINARY_FOLDER_NAME")})
			if uploadErr != nil {
				return request, uploadErr
			}
			// update avatar url
			decodedUser.Avatar = resp.SecureURL
		}

		// insert into database
		model := mongo.NewUpdateOneModel().SetFilter(bson.D{{Key: "username", Value: request.GetUsername()}}).SetUpdate(bson.M{"$set": &decodedUser}).SetUpsert(true)
		_ = utils.AccountCol.FindOneAndUpdate(context.Background(), model.Filter, model.Update)

	} else {
		fmt.Println(err)
	}
	return &decodedUser, nil
}

// DeleteUser
// remove user account from database
func (s *AuthSvcServer) DeleteUser(ctx context.Context, request *pb.UserRequest) (*pb.AuthResponse, error) {
	response := &pb.AuthResponse{}
	var decodedUser pb.CrowderUser
	if err := utils.AccountCol.FindOneAndDelete(context.Background(), bson.D{{Key: "id", Value: request.GetId()}}).Decode(&decodedUser); err == nil {
		response.Message = "Deleted successfully"
		response.Successful = true
		response.User = &decodedUser
	} else {
		response.Message = "Unable to complete this process"
	}
	return response, nil
}

// ResetPassword
// recover lost password
func (s *AuthSvcServer) ResetPassword(ctx context.Context, request *pb.ResetPasswordRequest) (*pb.AuthResponse, error) {
	response := &pb.AuthResponse{}
	var decodedUser pb.CrowderUser
	if err := utils.AccountCol.FindOne(ctx, bson.D{{Key: "username", Value: request.GetUsername()}}).Decode(&decodedUser); err == nil {

		// validate passwords
		if *utils.ValidatePasswords(request.GetOldPassword(), decodedUser.GetPassword(), decodedUser.GetSalt()) {
			salt, encoded := utils.EncodePassword(request.GetNewPassword())
			decodedUser.Salt = *salt
			decodedUser.Password = *encoded

			model := mongo.NewUpdateOneModel().SetFilter(bson.D{{Key: "username", Value: request.GetUsername()}}).SetUpdate(bson.M{"$set": &decodedUser}).SetUpsert(true)
			_ = utils.AccountCol.FindOneAndUpdate(context.Background(), model.Filter, model.Update)
			response.Message = "Password updated"
			response.Successful = true
			response.User = &decodedUser
		} else {
			response.Message = "Failed to update your password. Please enter the right credentials to continue"
		}
	} else {
		response.Message = "An account with this username does not exist. Please register to continue"
	}
	return response, nil
}

// GetUser
// get user stream data
func (s *AuthSvcServer) GetUser(request *pb.UserRequest, srv pb.AuthSvc_GetUserServer) error {
	ctx, response := srv.Context(), &pb.AuthResponse{}

	// get user details
	var decodedUser pb.CrowderUser
	if err := utils.AccountCol.FindOne(ctx, bson.D{{Key: "id", Value: request.GetId()}}).Decode(&decodedUser); err == nil {
		response.Successful = true
		response.Message = "User found"
		response.User = &decodedUser

		// send response to client
		_ = srv.Send(response)

		// start streaming data
		pipeline, streamOptions := utils.GetDefaultPipelineAndStreamOptions()
		stream, err := utils.AccountCol.Watch(ctx, pipeline, streamOptions)
		if err != nil {
			fmt.Printf("An error occurred: %v\n", err)
			response.Message = "unable to get user details"
		}

		for stream.Next(ctx) {
			// decode document
			var doc utils.MongoDocToProto[*pb.CrowderUser]
			_ = stream.Decode(&doc)
			if doc.OperationType != "delete" {
				response.Successful = true
				response.Message = "User created/updated"
				response.User = doc.FullDocument

				// send response to client
				_ = srv.Send(response)
			}
		}

	} else {
		response.Message = "unable to get user details"
		// send response to client
		_ = srv.Send(response)
	}

	// send response to client
	_ = srv.Send(response)
	return nil
}

// TODO
func (s *AuthSvcServer) GetUsers(request *pb.GetUsersRequest, srv pb.AuthSvc_GetUsersServer) error {
	ctx, response := srv.Context(), &pb.GetUsersResponse{}

	// get all users for a certain type
	if cursor, err := utils.AccountCol.Find(ctx, bson.D{{Key: "type", Value: request.GetUserType()}}); err == nil {
		var users []*pb.CrowderUser
		_ = cursor.All(ctx, &users)
		response.Users = users

		_ = srv.Send(response)
	}

	// start streaming data
	pipeline, streamOptions := utils.GetDefaultPipelineAndStreamOptions()
	stream, err := utils.AccountCol.Watch(ctx, pipeline, streamOptions)
	if err != nil {
		fmt.Printf("An error occurred: %v\n", err)
		return nil
	}

	for stream.Next(ctx) {
		// decode document
		var doc utils.MongoDocToProto[*pb.CrowderUser]
		_ = stream.Decode(&doc)
		switch doc.OperationType {
		case "delete":
			for index, person := range response.GetUsers() {
				if person.GetId() == doc.FullDocument.GetId() {
					response.Users = utils.RemoveIndex(response.GetUsers(), index)
				}
			}
			break
		case "update":
			for index, _ := range response.GetUsers() {
				response.GetUsers()[index] = doc.FullDocument
			}

			break
		default:
			response.Users = append(response.Users, doc.FullDocument)
			break
		}

		// send response to client
		_ = srv.Send(response)
	}

	return nil
}

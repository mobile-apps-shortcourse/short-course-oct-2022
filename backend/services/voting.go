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

// VotingSvcServer => grpc server implementation
type VotingSvcServer struct {
	pb.UnimplementedVotingSvcServer
}

// CreateCategory
func (s *VotingSvcServer) CreateCategory(ctx context.Context, request *pb.PollCategory) (*pb.VotingResponse, error) {
	response := &pb.VotingResponse{}
	var decodedDoc pb.CrowderUser

	// check if data already exists
	if err := utils.CategoryCol.FindOne(ctx, bson.D{{Key: "name", Value: request.GetName()}, {Key: "poll", Value: request.GetPoll()}}).Decode(&decodedDoc); err != nil {
		// user does not exist, create new account
		// assign unique id
		request.Id = primitive.NewObjectID().Hex()

		// if banner image does not start with http/https, perform upload to cloudinary
		cloudName, key, secret := os.Getenv("CLOUDINARY_CLOUD_NAME"), os.Getenv("CLOUDINARY_API_KEY"), os.Getenv("CLOUDINARY_SECRET")
		if !strings.HasPrefix(request.GetBannerImage(), "http") {
			cld, _ := cloud.NewFromParams(cloudName, key, secret)
			encoded := fmt.Sprintf("data:image/png;base64,%s", request.GetBannerImage())
			resp, uploadErr := cld.Upload.Upload(ctx, encoded,
				uploader.UploadParams{PublicID: fmt.Sprintf("%v_category_banner_image", request.GetId()),
					Folder: os.Getenv("CLOUDINARY_FOLDER_NAME")})
			if uploadErr != nil {
				return response, uploadErr
			}
			// update avatar url
			request.BannerImage = resp.SecureURL
		}

		// insert into database
		_, err := utils.CategoryCol.InsertOne(context.Background(), &request)

		if err != nil {
			fmt.Println(err)
			response.Message = err.Error()
		} else {
			response.Message = "Category created successfully"
			response.Category = request
			response.Successful = true
		}
	} else {
		fmt.Println(err)
		response.Message = "Category already exists for this poll"
	}
	return response, nil
}

// UpdateCategory
func (s *VotingSvcServer) UpdateCategory(ctx context.Context, request *pb.PollCategory) (*pb.VotingResponse, error) {
	response := &pb.VotingResponse{}
	var decodedDoc pb.PollCategory

	// check if user account already exists
	if err := utils.CategoryCol.FindOne(ctx, bson.D{{Key: "id", Value: request.GetId()}}).Decode(&decodedDoc); err == nil {

		// update props
		decodedDoc.Name = request.GetName()
		decodedDoc.Poll = request.GetPoll()

		// if avatar does not start with http/https, perform upload to cloudinary
		if !strings.HasPrefix(request.GetBannerImage(), "http") {
			cld, _ := cloud.NewFromParams(os.Getenv("CLOUDINARY_CLOUD_NAME"),
				os.Getenv("CLOUDINARY_API_KEY"), os.Getenv("CLOUDINARY_SECRET"))
			encoded := fmt.Sprintf("data:image/png;base64,%s", request.GetBannerImage())
			resp, uploadErr := cld.Upload.Upload(ctx, encoded,
				uploader.UploadParams{PublicID: fmt.Sprintf("%v_avatar", request.GetId()),
					Folder: os.Getenv("CLOUDINARY_FOLDER_NAME")})
			if uploadErr != nil {
				response.Category = &decodedDoc
				return response, uploadErr
			}
			// update avatar url
			decodedDoc.BannerImage = resp.SecureURL
		}

		// insert into database
		model := mongo.NewUpdateOneModel().SetFilter(bson.D{{Key: "id", Value: request.GetId()}}).SetUpdate(bson.M{"$set": &decodedDoc}).SetUpsert(true)
		_ = utils.CategoryCol.FindOneAndUpdate(context.Background(), model.Filter, model.Update)
		response.Successful = true
		response.Category = &decodedDoc
		response.Message = "Updated successfully"
	} else {
		fmt.Println(err)
	}
	return response, nil
}

// DeleteCategory
func (s *VotingSvcServer) DeleteCategory(ctx context.Context, request *pb.DeleteVotingItemRequest) (*pb.VotingResponse, error) {
	response := &pb.VotingResponse{}
	var decodedDoc pb.PollCategory
	if err := utils.CategoryCol.FindOneAndDelete(context.Background(), bson.D{{Key: "id", Value: request.GetId()}}).Decode(&decodedDoc); err == nil {
		response.Message = "Deleted successfully"
		response.Successful = true
		response.Category = &decodedDoc
	} else {
		response.Message = "Unable to complete this process"
	}
	return response, nil
}

// GetCategory
func (s *VotingSvcServer) GetCategory(ctx context.Context, request *pb.GetVotingItemRequest) (*pb.VotingResponse, error) {
	response := &pb.VotingResponse{}

	// get user details
	var decodedDoc pb.PollCategory
	if err := utils.CategoryCol.FindOne(ctx, bson.D{{Key: "id", Value: request.GetId()}}).Decode(&decodedDoc); err == nil {
		response.Successful = true
		response.Message = "Data found"
		response.Category = &decodedDoc
	} else {
		response.Message = "unable to get details"
	}
	return response, nil
}

// GetCategories
func (s *VotingSvcServer) GetCategories(request *pb.GetCategoriesRequest, srv pb.VotingSvc_GetCategoriesServer) error {
	ctx, response := srv.Context(), &pb.GetCategoriesResponse{}

	// get all categories
	if cursor, err := utils.CategoryCol.Find(ctx, bson.D{{Key: "poll", Value: request.GetPoll()}}); err == nil {
		var categories []*pb.PollCategory
		_ = cursor.All(ctx, &categories)
		response.Categories = categories
		_ = srv.Send(response)

		// start streaming
		pipeline, streamOptions := utils.GetDefaultPipelineAndStreamOptions()
		stream, _ := utils.CategoryCol.Watch(ctx, pipeline, streamOptions)

		for stream.Next(ctx) {
			// decode document
			var doc utils.MongoDocToProto[*pb.PollCategory]
			_ = stream.Decode(&doc)
			switch doc.OperationType {
			case "delete":
				for index, person := range response.GetCategories() {
					if person.GetId() == doc.FullDocument.GetId() {
						response.Categories = utils.RemoveIndex(response.GetCategories(), index)
					}
				}
			case "update":
				for index := range response.GetCategories() {
					response.GetCategories()[index] = doc.FullDocument
				}
			default:
				response.Categories = append(response.GetCategories(), doc.FullDocument)
			}
		}
	}
	return nil
}

// CreatePoll
func (s *VotingSvcServer) CreatePoll(ctx context.Context, request *pb.Poll) (*pb.VotingResponse, error) {
	response := &pb.VotingResponse{}
	var decodedDoc pb.Poll

	// check if data already exists
	if err := utils.PollCol.FindOne(ctx, bson.D{{Key: "title", Value: request.GetTitle()}, {Key: "organizer", Value: request.GetOrganizer()}}).Decode(&decodedDoc); err != nil {
		// user does not exist, create new account
		// assign unique id
		request.Id = primitive.NewObjectID().Hex()

		// if banner image does not start with http/https, perform upload to cloudinary
		cloudName, key, secret := os.Getenv("CLOUDINARY_CLOUD_NAME"), os.Getenv("CLOUDINARY_API_KEY"), os.Getenv("CLOUDINARY_SECRET")
		if !strings.HasPrefix(request.GetBannerImage(), "http") {
			cld, _ := cloud.NewFromParams(cloudName, key, secret)
			encoded := fmt.Sprintf("data:image/png;base64,%s", request.GetBannerImage())
			resp, uploadErr := cld.Upload.Upload(ctx, encoded,
				uploader.UploadParams{PublicID: fmt.Sprintf("%v_banner_image", request.GetId()),
					Folder: os.Getenv("CLOUDINARY_FOLDER_NAME")})
			if uploadErr != nil {
				return response, uploadErr
			}
			// update avatar url
			request.BannerImage = resp.SecureURL
		}

		// insert into database
		_, err := utils.PollCol.InsertOne(context.Background(), &request)

		if err != nil {
			fmt.Println(err)
			response.Message = err.Error()
		} else {
			response.Message = "Poll created successfully"
			response.Poll = request
			response.Successful = true
		}
	} else {
		fmt.Println(err)
		response.Message = "Poll already exists for this organizer"
	}
	return response, nil
}

// UpdateCategory
func (s *VotingSvcServer) UpdatePoll(ctx context.Context, request *pb.Poll) (*pb.VotingResponse, error) {
	response := &pb.VotingResponse{}
	var decodedDoc pb.Poll

	// check if user account already exists
	if err := utils.PollCol.FindOne(ctx, bson.D{{Key: "id", Value: request.GetId()}}).Decode(&decodedDoc); err == nil {

		// update props
		decodedDoc.Description = request.GetDescription()
		decodedDoc.Title = request.GetTitle()
		decodedDoc.Categories = request.GetCategories()
		decodedDoc.EndTimestamp = request.GetEndTimestamp()
		decodedDoc.StartTimestamp = request.GetStartTimestamp()
		decodedDoc.Organizer = request.GetOrganizer()
		decodedDoc.Status = request.GetStatus()
		decodedDoc.Candidates = request.GetCandidates()

		// insert into database
		model := mongo.NewUpdateOneModel().SetFilter(bson.D{{Key: "id", Value: request.GetId()}}).SetUpdate(bson.M{"$set": &decodedDoc}).SetUpsert(true)
		_ = utils.PollCol.FindOneAndUpdate(context.Background(), model.Filter, model.Update)
		response.Successful = true
		response.Poll = &decodedDoc
		response.Message = "Updated successfully"
	} else {
		fmt.Println(err)
	}
	return response, nil
}

// DeletePoll
func (s *VotingSvcServer) DeletePoll(ctx context.Context, request *pb.DeleteVotingItemRequest) (*pb.VotingResponse, error) {
	response := &pb.VotingResponse{}
	var decodedDoc pb.Poll
	if err := utils.PollCol.FindOneAndDelete(context.Background(), bson.D{{Key: "id", Value: request.GetId()}}).Decode(&decodedDoc); err == nil {
		response.Message = "Deleted successfully"
		response.Successful = true
		response.Poll = &decodedDoc
	} else {
		response.Message = "Unable to complete this process"
	}
	return response, nil
}

// GetPoll
func (s *VotingSvcServer) GetPoll(request *pb.GetVotingItemRequest, srv pb.VotingSvc_GetPollServer) error {
	ctx, response := srv.Context(), &pb.VotingResponse{}

	// get user details
	var decodedDoc pb.Poll
	if err := utils.PollCol.FindOne(ctx, bson.D{{Key: "id", Value: request.GetId()}}).Decode(&decodedDoc); err == nil {
		response.Successful = true
		response.Message = "Data found"
		response.Poll = &decodedDoc
		_ = srv.Send(response)

		// start streaming
		pipeline, streamOptions := utils.GetDefaultPipelineAndStreamOptions()
		stream, _ := utils.PollCol.Watch(ctx, pipeline, streamOptions)

		for stream.Next(ctx) {
			// decode document
			var doc utils.MongoDocToProto[*pb.Poll]
			_ = stream.Decode(&doc)
			if doc.OperationType != "delete" {
				response.Successful = true
				response.Message = "Poll created/updated"
				response.Poll = doc.FullDocument

				// send response to client
				_ = srv.Send(response)
			}
		}

	} else {
		response.Message = "unable to get details"
	}
	return nil
}

// GetPollsForUser
// retrieves all polls created / participated by user
func (s *VotingSvcServer) GetPollsForUser(request *pb.GetPollsRequest, srv pb.VotingSvc_GetPollsForUserServer) error {
	ctx, response := srv.Context(), &pb.GetPollsResponse{}

	// get all polls
	if cursor, err := utils.PollCol.Find(ctx, bson.D{}); err == nil {
		var polls []*pb.Poll
		var pollsForUser []*pb.Poll
		_ = cursor.All(ctx, &polls)

		for _, poll := range polls {
			switch request.GetUserType() {
			//voters
			case int32(pb.UserType_voter):
				shouldAdd := false
				for _, candidateDoc := range poll.GetCandidates() {
					shouldAdd = utils.SliceContains(candidateDoc.GetVotes(), request.GetUserId())

					// update user's poll list
					if shouldAdd && !utils.SliceContains(pollsForUser, poll) {
						pollsForUser = append(pollsForUser, poll)
						response.Polls = pollsForUser
					}
				}

				// candidates
			case int32(pb.UserType_candidate):
				for _, candidateDoc := range poll.GetCandidates() {
					// update user's poll list
					if candidateDoc.GetCandidate() == request.GetUserId() && !utils.SliceContains(pollsForUser, poll) {
						pollsForUser = append(pollsForUser, poll)
						response.Polls = pollsForUser
					}
				}

				// organizers
			default:
				if poll.GetOrganizer() == request.GetUserId() {
					pollsForUser = append(pollsForUser, poll)
					response.Polls = pollsForUser
				}
			}
		}

		// send response to client
		_ = srv.Send(response)

		// start streaming
		pipeline, streamOptions := utils.GetDefaultPipelineAndStreamOptions()
		stream, _ := utils.PollCol.Watch(ctx, pipeline, streamOptions)

		for stream.Next(ctx) {
			// decode document
			var doc utils.MongoDocToProto[*pb.Poll]
			_ = stream.Decode(&doc)
			switch doc.OperationType {
			case "delete":
				for index, poll := range response.GetPolls() {
					if poll.GetId() == doc.FullDocument.GetId() {
						response.Polls = utils.RemoveIndex(response.GetPolls(), index)
					}
				}
			case "update":
				for index, poll := range response.GetPolls() {
					if poll.GetId() == doc.FullDocument.GetId() {
						response.GetPolls()[index] = doc.FullDocument
					}
				}
			default:
				response.Polls = append(response.GetPolls(), doc.FullDocument)
			}

			_ = srv.Send(response)
		}
	}
	return nil
}

// GetPolls
func (s *VotingSvcServer) GetPolls(request *pb.GetPollsRequest, srv pb.VotingSvc_GetPollsServer) error {
	ctx, response := srv.Context(), &pb.GetPollsResponse{}

	// get all polls
	if cursor, err := utils.PollCol.Find(ctx, bson.D{{Key: "status", Value: request.GetStatus()}}); err == nil {
		var polls []*pb.Poll
		_ = cursor.All(ctx, &polls)
		response.Polls = polls
		_ = srv.Send(response)

		// start streaming
		pipeline, streamOptions := utils.GetDefaultPipelineAndStreamOptions()
		stream, _ := utils.PollCol.Watch(ctx, pipeline, streamOptions)

		for stream.Next(ctx) {
			// decode document
			var doc utils.MongoDocToProto[*pb.Poll]
			_ = stream.Decode(&doc)
			switch doc.OperationType {
			case "delete":
				for index, poll := range response.GetPolls() {
					if poll.GetId() == doc.FullDocument.GetId() {
						response.Polls = utils.RemoveIndex(response.GetPolls(), index)
					}
				}
			case "update":
				for index, poll := range response.GetPolls() {
					if doc.FullDocument.GetStatus() == request.GetStatus() && poll.GetId() == doc.FullDocument.GetId() {
						response.GetPolls()[index] = doc.FullDocument
					}
				}
			default:
				if doc.FullDocument.GetStatus() == request.GetStatus() {
					response.Polls = append(response.GetPolls(), doc.FullDocument)
				}
			}

			_ = srv.Send(response)
		}
	}
	return nil
}

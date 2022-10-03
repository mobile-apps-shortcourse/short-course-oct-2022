package services

import (
	"context"
	pb "crowder.com/generated"
)

// AuthSvcServer => grpc server implementation
type AuthSvcServer struct {
	pb.UnimplementedAuthSvcServer
}

// TODO
func (s *AuthSvcServer) CreateUser(ctx context.Context, request *pb.CrowderUser) (*pb.AuthResponse, error) {
	response := &pb.AuthResponse{}

	response.Message = "This service is currently unavailable"
	response.Successful = true
	return response, nil
}

// TODO
func (s *AuthSvcServer) Login(ctx context.Context, request *pb.LoginRequest) (*pb.AuthResponse, error) {
	response := &pb.AuthResponse{}

	response.Message = "This service is currently unavailable"
	return response, nil
}

// TODO
func (s *AuthSvcServer) UpdateUser(ctx context.Context, request *pb.CrowderUser) (*pb.CrowderUser, error) {

	return request, nil
}

// TODO
func (s *AuthSvcServer) DeleteUser(ctx context.Context, request *pb.UserRequest) (*pb.AuthResponse, error) {
	response := &pb.AuthResponse{}

	response.Message = "This service is currently unavailable"
	return response, nil
}

// TODO
func (s *AuthSvcServer) ResetPassword(ctx context.Context, request *pb.ResetPasswordRequest) (*pb.AuthResponse, error) {
	response := &pb.AuthResponse{}

	response.Message = "This service is currently unavailable"
	return response, nil
}

// TODO
func (s *AuthSvcServer) GetUser(request *pb.UserRequest, srv pb.AuthSvc_GetUserServer) error {
	response := &pb.AuthResponse{}

	response.Message = "This service is currently unavailable"
	return nil
}

// TODO
func (s *AuthSvcServer) GetUsers(request *pb.GetUsersRequest, srv pb.AuthSvc_GetUsersServer) error {
	//response := &pb.GetUsersResponse{}

	return nil
}

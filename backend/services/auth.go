package services

import (
	pb "crowder.com/generated"
)

// AuthSvcServer => grpc server implementation
type AuthSvcServer struct {
	pb.UnimplementedAuthSvcServer
}

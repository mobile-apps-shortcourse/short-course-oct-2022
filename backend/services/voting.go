package services

import (
	pb "crowder.com/generated"
)

// VotingSvcServer => grpc server implementation
type VotingSvcServer struct {
	pb.UnimplementedVotingSvcServer
}

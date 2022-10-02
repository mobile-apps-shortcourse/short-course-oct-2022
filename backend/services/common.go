package services

import (
	pb "crowder.com/generated"
)

// CommonSvcServer => grpc server implementation
type CommonSvcServer struct {
	pb.UnimplementedCommonSvcServer
}

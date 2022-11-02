package main

import (
	pb "crowder.com/generated"
	svc "crowder.com/services"
	"fmt"
	"github.com/joho/godotenv"
	_ "github.com/joho/godotenv/autoload"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	"log"
	"net"
)

func main() {
	// loading .env file
	err := godotenv.Load()
	if err != nil {
		fmt.Printf("unable to decode .env file => %v", err)
		return
	}

	// lis, err => listen for server
	lis, err := net.Listen("tcp", ":2022")
	if err != nil {
		log.Fatalf("error connecting to server: %v", err)
		return
	}
	log.Printf("server started on address: %v", lis.Addr())

	srv := grpc.NewServer()
	pb.RegisterAuthSvcServer(srv, &svc.AuthSvcServer{})
	pb.RegisterVotingSvcServer(srv, &svc.VotingSvcServer{})
	pb.RegisterCommonSvcServer(srv, &svc.CommonSvcServer{})
	reflection.Register(srv)
	if err := srv.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}

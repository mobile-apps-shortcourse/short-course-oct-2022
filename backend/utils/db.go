package utils

import (
	"context"
	"log"
	"os"
	"time"

	codecs "github.com/amsokol/mongo-go-driver-protobuf"
	"github.com/joho/godotenv"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	dbOpts "go.mongodb.org/mongo-driver/mongo/options"
)

// GetMongoClient
// https://cloud.mongodb.com/v2/61e00d8a68dec93000bf563c#clusters/connect?clusterId=Cluster0
func GetMongoClient() *mongo.Database {
	// Register custom codecs for protobuf Timestamp and wrapper types
	reg := codecs.Register(bson.NewRegistryBuilder()).Build()

	serverAPIOptions := dbOpts.ServerAPI(dbOpts.ServerAPIVersion1)
	clientOptions := dbOpts.Client().
		ApplyURI(GetMongoUri()).
		SetServerAPIOptions(serverAPIOptions)
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()
	client, err := mongo.Connect(ctx, clientOptions, &dbOpts.ClientOptions{
		Registry: reg,
	})
	if err != nil {
		log.Fatal(err)
	}
	_ = godotenv.Load(".env")

	return client.Database(os.Getenv("MONGODB_DB_NAME"), nil)
}

// collections in database
var (
	AccountCol  = GetMongoClient().Collection("crowder-accounts")
	PollCol     = GetMongoClient().Collection("crowder-polls")
	CategoryCol = GetMongoClient().Collection("crowder-categories")
)

package utils

import (
	"fmt"
	"os"

	"github.com/joho/godotenv"
)

// GetMongoUri => connection string for mongo atlas
func GetMongoUri() string {
	_ = godotenv.Load(".env")
	return fmt.Sprintf("mongodb+srv://%s:%s@cluster0.hfgp5yk.mongodb.net/%s?retryWrites=true&w=majority", os.Getenv("MONGODB_USERNAME"), os.Getenv("MONGODB_PASSWORD"), os.Getenv("MONGODB_DB_NAME"))
}

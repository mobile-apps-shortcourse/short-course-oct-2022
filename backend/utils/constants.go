package utils

import (
	"fmt"
	_ "github.com/joho/godotenv/autoload"
	"os"
)

// GetMongoUri => connection string for mongo atlas
func GetMongoUri() string {
	var uri string
	uri = fmt.Sprintf("mongodb+srv://%s:%s@cluster0.17ikbye.mongodb.net/%s?retryWrites=true&w=majority", os.Getenv("MONGODB_USERNAME"), os.Getenv("MONGODB_PASSWORD"), os.Getenv("MONGODB_DB_NAME"))
	return uri
}

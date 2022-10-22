package utils

import (
	_ "github.com/joho/godotenv/autoload"
)

// GetMongoUri => connection string for mongo atlas
func GetMongoUri() string {
	var uri string
	//if err := godotenv.Load("./.env"); err == nil {
	//
	//uri = fmt.Sprintf("mongodb+srv://%s:%s@cluster0.17ikbye.mongodb.net/%s?retryWrites=true&w=majority", os.Getenv("MONGODB_USERNAME"), os.Getenv("MONGODB_PASSWORD"), os.Getenv("MONGODB_DB_NAME"))
	uri = "mongodb+srv://crowder:dKMHTrv9Ms9F6dZJ@cluster0.17ikbye.mongodb.net/crowder?retryWrites=true&w=majority"
	return uri
}

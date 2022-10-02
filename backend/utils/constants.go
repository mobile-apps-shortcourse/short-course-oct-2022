package utils

import "fmt"

const (
	AppDatabaseName = "crowder"
)

// GetMongoUri => connection string for mongo atlas
func GetMongoUri() string {
	return fmt.Sprintf("mongodb+srv://bespa-admin:viBKvE2Ufh32YRQA@cluster0.hfgp5yk.mongodb.net/%s?retryWrites=true&w=majority", AppDatabaseName)
}

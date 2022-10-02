package utils

import (
	"fmt"
	"go.mongodb.org/mongo-driver/mongo"
	op "go.mongodb.org/mongo-driver/mongo/options"
)

// SliceContains => checks if an element is present in a slice
// https://play.golang.org/p/Qg_uv_inCek
func SliceContains[T comparable](s []T, str T) bool {
	for _, v := range s {
		if v == str {
			return true
		}
	}

	return false
}

// RemoveIndex => removes an item from a list
// todo => handle deletion of doc from stream
func RemoveIndex[T any](s []T, i int) []T {
	fmt.Println("The original array is:", s)
	// check if the index is within array bounds
	if i < 0 || i >= len(s) {
		fmt.Println("The given index is out of bounds.")
		return s
	} else {
		// delete an element from the array
		newLength := 0
		for index := range s {
			if i != index {
				s[newLength] = s[index]
				newLength++
			}
		}

		// reslice the array to remove extra index
		newArray := s[:newLength]
		fmt.Println("The new array is:", newArray)
		return newArray
	}
}

// MongoDocToProto => helper generic struct to convert full document to proto
type MongoDocToProto[T any] struct {
	FullDocument  T
	OperationType string
}

// GetDefaultPipelineAndStreamOptions => option for updating streams of documents from a collection
func GetDefaultPipelineAndStreamOptions() (mongo.Pipeline, *op.ChangeStreamOptions) {
	streamOptions := op.ChangeStream().SetFullDocument(op.UpdateLookup)
	return mongo.Pipeline{}, streamOptions
}

package utils

import (
	"crypto/md5"
	"fmt"
	encoder "github.com/anaskhan96/go-password-encoder"
)

// options => options for encoding
var options = &encoder.Options{SaltLen: 10, Iterations: 10000, KeyLen: 20, HashFunction: md5.New}

func EncodePassword(pwd string) (*string, *string) {
	salt, encoded := encoder.Encode(pwd, options)
	return &salt, &encoded
}

func ValidatePasswords(rawPwd string, encodedPwd string, salt string) *bool {
	check := encoder.Verify(rawPwd, salt, encodedPwd, options)
	fmt.Printf("checking valid password: %v\n", check)
	return &check
}

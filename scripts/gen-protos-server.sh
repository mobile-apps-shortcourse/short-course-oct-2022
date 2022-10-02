# shellcheck disable=SC2046
PROTO_PATH=protos

# generate for backend
cd /Users/quabynah/src/projects/ug/short-course/backend || exit

protoc --proto_path=$PROTO_PATH --go_out=./generated --go_opt=paths=source_relative \
  --go-grpc_out=./generated --go-grpc_opt=paths=source_relative \
  $(find $PROTO_PATH -iname "*.proto")

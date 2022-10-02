# shellcheck disable=SC2046
PROTO_PATH=/Users/quabynah/src/projects/ug/short-course/backend/protos

# generate for mobile
cd /Users/quabynah/src/projects/ug/short-course/mobile || exit
protoc -I=$PROTO_PATH \
  --dart_out=grpc:lib/protos \
  $(find $PROTO_PATH -iname "*.proto")

// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.0
// 	protoc        v3.21.6
// source: voting.proto

// import "google/protobuf/empty.proto";

package ms

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	timestamppb "google.golang.org/protobuf/types/known/timestamppb"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type PollStatus int32

const (
	PollStatus_unknown PollStatus = 0
	PollStatus_pending PollStatus = 1
	PollStatus_active  PollStatus = 2
	PollStatus_expired PollStatus = 3
)

// Enum value maps for PollStatus.
var (
	PollStatus_name = map[int32]string{
		0: "unknown",
		1: "pending",
		2: "active",
		3: "expired",
	}
	PollStatus_value = map[string]int32{
		"unknown": 0,
		"pending": 1,
		"active":  2,
		"expired": 3,
	}
)

func (x PollStatus) Enum() *PollStatus {
	p := new(PollStatus)
	*p = x
	return p
}

func (x PollStatus) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (PollStatus) Descriptor() protoreflect.EnumDescriptor {
	return file_voting_proto_enumTypes[0].Descriptor()
}

func (PollStatus) Type() protoreflect.EnumType {
	return &file_voting_proto_enumTypes[0]
}

func (x PollStatus) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use PollStatus.Descriptor instead.
func (PollStatus) EnumDescriptor() ([]byte, []int) {
	return file_voting_proto_rawDescGZIP(), []int{0}
}

type Poll struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id             string                 `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
	Title          string                 `protobuf:"bytes,2,opt,name=title,proto3" json:"title,omitempty"`
	Organizer      string                 `protobuf:"bytes,3,opt,name=organizer,proto3" json:"organizer,omitempty"`
	Categories     []string               `protobuf:"bytes,4,rep,name=categories,proto3" json:"categories,omitempty"`
	Status         PollStatus             `protobuf:"varint,5,opt,name=status,proto3,enum=crowder.PollStatus" json:"status,omitempty"`
	Description    string                 `protobuf:"bytes,6,opt,name=description,proto3" json:"description,omitempty"`
	Candidates     []*PollCandidate       `protobuf:"bytes,7,rep,name=candidates,proto3" json:"candidates,omitempty"`
	StartTimestamp *timestamppb.Timestamp `protobuf:"bytes,8,opt,name=startTimestamp,proto3" json:"startTimestamp,omitempty"`
	EndTimestamp   *timestamppb.Timestamp `protobuf:"bytes,9,opt,name=endTimestamp,proto3" json:"endTimestamp,omitempty"`
	BannerImage    string                 `protobuf:"bytes,10,opt,name=bannerImage,proto3" json:"bannerImage,omitempty"`
}

func (x *Poll) Reset() {
	*x = Poll{}
	if protoimpl.UnsafeEnabled {
		mi := &file_voting_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Poll) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Poll) ProtoMessage() {}

func (x *Poll) ProtoReflect() protoreflect.Message {
	mi := &file_voting_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Poll.ProtoReflect.Descriptor instead.
func (*Poll) Descriptor() ([]byte, []int) {
	return file_voting_proto_rawDescGZIP(), []int{0}
}

func (x *Poll) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

func (x *Poll) GetTitle() string {
	if x != nil {
		return x.Title
	}
	return ""
}

func (x *Poll) GetOrganizer() string {
	if x != nil {
		return x.Organizer
	}
	return ""
}

func (x *Poll) GetCategories() []string {
	if x != nil {
		return x.Categories
	}
	return nil
}

func (x *Poll) GetStatus() PollStatus {
	if x != nil {
		return x.Status
	}
	return PollStatus_unknown
}

func (x *Poll) GetDescription() string {
	if x != nil {
		return x.Description
	}
	return ""
}

func (x *Poll) GetCandidates() []*PollCandidate {
	if x != nil {
		return x.Candidates
	}
	return nil
}

func (x *Poll) GetStartTimestamp() *timestamppb.Timestamp {
	if x != nil {
		return x.StartTimestamp
	}
	return nil
}

func (x *Poll) GetEndTimestamp() *timestamppb.Timestamp {
	if x != nil {
		return x.EndTimestamp
	}
	return nil
}

func (x *Poll) GetBannerImage() string {
	if x != nil {
		return x.BannerImage
	}
	return ""
}

// category for each poll
type PollCategory struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id          string `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
	Name        string `protobuf:"bytes,2,opt,name=name,proto3" json:"name,omitempty"`
	BannerImage string `protobuf:"bytes,3,opt,name=bannerImage,proto3" json:"bannerImage,omitempty"` // optional
	Poll        string `protobuf:"bytes,4,opt,name=poll,proto3" json:"poll,omitempty"`               // optional
}

func (x *PollCategory) Reset() {
	*x = PollCategory{}
	if protoimpl.UnsafeEnabled {
		mi := &file_voting_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *PollCategory) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*PollCategory) ProtoMessage() {}

func (x *PollCategory) ProtoReflect() protoreflect.Message {
	mi := &file_voting_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use PollCategory.ProtoReflect.Descriptor instead.
func (*PollCategory) Descriptor() ([]byte, []int) {
	return file_voting_proto_rawDescGZIP(), []int{1}
}

func (x *PollCategory) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

func (x *PollCategory) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *PollCategory) GetBannerImage() string {
	if x != nil {
		return x.BannerImage
	}
	return ""
}

func (x *PollCategory) GetPoll() string {
	if x != nil {
		return x.Poll
	}
	return ""
}

type PollCandidate struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Candidate string   `protobuf:"bytes,1,opt,name=candidate,proto3" json:"candidate,omitempty"`
	Category  string   `protobuf:"bytes,2,opt,name=category,proto3" json:"category,omitempty"`
	Votes     []string `protobuf:"bytes,3,rep,name=votes,proto3" json:"votes,omitempty"`
}

func (x *PollCandidate) Reset() {
	*x = PollCandidate{}
	if protoimpl.UnsafeEnabled {
		mi := &file_voting_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *PollCandidate) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*PollCandidate) ProtoMessage() {}

func (x *PollCandidate) ProtoReflect() protoreflect.Message {
	mi := &file_voting_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use PollCandidate.ProtoReflect.Descriptor instead.
func (*PollCandidate) Descriptor() ([]byte, []int) {
	return file_voting_proto_rawDescGZIP(), []int{2}
}

func (x *PollCandidate) GetCandidate() string {
	if x != nil {
		return x.Candidate
	}
	return ""
}

func (x *PollCandidate) GetCategory() string {
	if x != nil {
		return x.Category
	}
	return ""
}

func (x *PollCandidate) GetVotes() []string {
	if x != nil {
		return x.Votes
	}
	return nil
}

type GetPollsResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Polls []*Poll `protobuf:"bytes,1,rep,name=polls,proto3" json:"polls,omitempty"`
}

func (x *GetPollsResponse) Reset() {
	*x = GetPollsResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_voting_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetPollsResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetPollsResponse) ProtoMessage() {}

func (x *GetPollsResponse) ProtoReflect() protoreflect.Message {
	mi := &file_voting_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetPollsResponse.ProtoReflect.Descriptor instead.
func (*GetPollsResponse) Descriptor() ([]byte, []int) {
	return file_voting_proto_rawDescGZIP(), []int{3}
}

func (x *GetPollsResponse) GetPolls() []*Poll {
	if x != nil {
		return x.Polls
	}
	return nil
}

type GetPollsRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Status   PollStatus `protobuf:"varint,1,opt,name=status,proto3,enum=crowder.PollStatus" json:"status,omitempty"`
	UserId   string     `protobuf:"bytes,2,opt,name=userId,proto3" json:"userId,omitempty"`
	UserType int32      `protobuf:"varint,3,opt,name=userType,proto3" json:"userType,omitempty"`
}

func (x *GetPollsRequest) Reset() {
	*x = GetPollsRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_voting_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetPollsRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetPollsRequest) ProtoMessage() {}

func (x *GetPollsRequest) ProtoReflect() protoreflect.Message {
	mi := &file_voting_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetPollsRequest.ProtoReflect.Descriptor instead.
func (*GetPollsRequest) Descriptor() ([]byte, []int) {
	return file_voting_proto_rawDescGZIP(), []int{4}
}

func (x *GetPollsRequest) GetStatus() PollStatus {
	if x != nil {
		return x.Status
	}
	return PollStatus_unknown
}

func (x *GetPollsRequest) GetUserId() string {
	if x != nil {
		return x.UserId
	}
	return ""
}

func (x *GetPollsRequest) GetUserType() int32 {
	if x != nil {
		return x.UserType
	}
	return 0
}

type GetCategoriesRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Poll string `protobuf:"bytes,1,opt,name=poll,proto3" json:"poll,omitempty"`
}

func (x *GetCategoriesRequest) Reset() {
	*x = GetCategoriesRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_voting_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetCategoriesRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetCategoriesRequest) ProtoMessage() {}

func (x *GetCategoriesRequest) ProtoReflect() protoreflect.Message {
	mi := &file_voting_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetCategoriesRequest.ProtoReflect.Descriptor instead.
func (*GetCategoriesRequest) Descriptor() ([]byte, []int) {
	return file_voting_proto_rawDescGZIP(), []int{5}
}

func (x *GetCategoriesRequest) GetPoll() string {
	if x != nil {
		return x.Poll
	}
	return ""
}

type GetVotingItemRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id string `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
}

func (x *GetVotingItemRequest) Reset() {
	*x = GetVotingItemRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_voting_proto_msgTypes[6]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetVotingItemRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetVotingItemRequest) ProtoMessage() {}

func (x *GetVotingItemRequest) ProtoReflect() protoreflect.Message {
	mi := &file_voting_proto_msgTypes[6]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetVotingItemRequest.ProtoReflect.Descriptor instead.
func (*GetVotingItemRequest) Descriptor() ([]byte, []int) {
	return file_voting_proto_rawDescGZIP(), []int{6}
}

func (x *GetVotingItemRequest) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

type GetCategoriesResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Categories []*PollCategory `protobuf:"bytes,1,rep,name=categories,proto3" json:"categories,omitempty"`
}

func (x *GetCategoriesResponse) Reset() {
	*x = GetCategoriesResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_voting_proto_msgTypes[7]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetCategoriesResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetCategoriesResponse) ProtoMessage() {}

func (x *GetCategoriesResponse) ProtoReflect() protoreflect.Message {
	mi := &file_voting_proto_msgTypes[7]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetCategoriesResponse.ProtoReflect.Descriptor instead.
func (*GetCategoriesResponse) Descriptor() ([]byte, []int) {
	return file_voting_proto_rawDescGZIP(), []int{7}
}

func (x *GetCategoriesResponse) GetCategories() []*PollCategory {
	if x != nil {
		return x.Categories
	}
	return nil
}

type DeleteVotingItemRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id string `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
}

func (x *DeleteVotingItemRequest) Reset() {
	*x = DeleteVotingItemRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_voting_proto_msgTypes[8]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DeleteVotingItemRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeleteVotingItemRequest) ProtoMessage() {}

func (x *DeleteVotingItemRequest) ProtoReflect() protoreflect.Message {
	mi := &file_voting_proto_msgTypes[8]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeleteVotingItemRequest.ProtoReflect.Descriptor instead.
func (*DeleteVotingItemRequest) Descriptor() ([]byte, []int) {
	return file_voting_proto_rawDescGZIP(), []int{8}
}

func (x *DeleteVotingItemRequest) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

type VotingResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Successful bool          `protobuf:"varint,1,opt,name=successful,proto3" json:"successful,omitempty"`
	Message    string        `protobuf:"bytes,2,opt,name=message,proto3" json:"message,omitempty"`
	Poll       *Poll         `protobuf:"bytes,3,opt,name=poll,proto3" json:"poll,omitempty"`
	Category   *PollCategory `protobuf:"bytes,4,opt,name=category,proto3" json:"category,omitempty"`
}

func (x *VotingResponse) Reset() {
	*x = VotingResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_voting_proto_msgTypes[9]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *VotingResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*VotingResponse) ProtoMessage() {}

func (x *VotingResponse) ProtoReflect() protoreflect.Message {
	mi := &file_voting_proto_msgTypes[9]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use VotingResponse.ProtoReflect.Descriptor instead.
func (*VotingResponse) Descriptor() ([]byte, []int) {
	return file_voting_proto_rawDescGZIP(), []int{9}
}

func (x *VotingResponse) GetSuccessful() bool {
	if x != nil {
		return x.Successful
	}
	return false
}

func (x *VotingResponse) GetMessage() string {
	if x != nil {
		return x.Message
	}
	return ""
}

func (x *VotingResponse) GetPoll() *Poll {
	if x != nil {
		return x.Poll
	}
	return nil
}

func (x *VotingResponse) GetCategory() *PollCategory {
	if x != nil {
		return x.Category
	}
	return nil
}

var File_voting_proto protoreflect.FileDescriptor

var file_voting_proto_rawDesc = []byte{
	0x0a, 0x0c, 0x76, 0x6f, 0x74, 0x69, 0x6e, 0x67, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x07,
	0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x1a, 0x1f, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61,
	0x6d, 0x70, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x97, 0x03, 0x0a, 0x04, 0x50, 0x6f, 0x6c,
	0x6c, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x02, 0x69,
	0x64, 0x12, 0x14, 0x0a, 0x05, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x05, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x12, 0x1c, 0x0a, 0x09, 0x6f, 0x72, 0x67, 0x61, 0x6e,
	0x69, 0x7a, 0x65, 0x72, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x6f, 0x72, 0x67, 0x61,
	0x6e, 0x69, 0x7a, 0x65, 0x72, 0x12, 0x1e, 0x0a, 0x0a, 0x63, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72,
	0x69, 0x65, 0x73, 0x18, 0x04, 0x20, 0x03, 0x28, 0x09, 0x52, 0x0a, 0x63, 0x61, 0x74, 0x65, 0x67,
	0x6f, 0x72, 0x69, 0x65, 0x73, 0x12, 0x2b, 0x0a, 0x06, 0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x18,
	0x05, 0x20, 0x01, 0x28, 0x0e, 0x32, 0x13, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e,
	0x50, 0x6f, 0x6c, 0x6c, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x52, 0x06, 0x73, 0x74, 0x61, 0x74,
	0x75, 0x73, 0x12, 0x20, 0x0a, 0x0b, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6f,
	0x6e, 0x18, 0x06, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70,
	0x74, 0x69, 0x6f, 0x6e, 0x12, 0x36, 0x0a, 0x0a, 0x63, 0x61, 0x6e, 0x64, 0x69, 0x64, 0x61, 0x74,
	0x65, 0x73, 0x18, 0x07, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x16, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64,
	0x65, 0x72, 0x2e, 0x50, 0x6f, 0x6c, 0x6c, 0x43, 0x61, 0x6e, 0x64, 0x69, 0x64, 0x61, 0x74, 0x65,
	0x52, 0x0a, 0x63, 0x61, 0x6e, 0x64, 0x69, 0x64, 0x61, 0x74, 0x65, 0x73, 0x12, 0x42, 0x0a, 0x0e,
	0x73, 0x74, 0x61, 0x72, 0x74, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x18, 0x08,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70,
	0x52, 0x0e, 0x73, 0x74, 0x61, 0x72, 0x74, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70,
	0x12, 0x3e, 0x0a, 0x0c, 0x65, 0x6e, 0x64, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70,
	0x18, 0x09, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61,
	0x6d, 0x70, 0x52, 0x0c, 0x65, 0x6e, 0x64, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70,
	0x12, 0x20, 0x0a, 0x0b, 0x62, 0x61, 0x6e, 0x6e, 0x65, 0x72, 0x49, 0x6d, 0x61, 0x67, 0x65, 0x18,
	0x0a, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x62, 0x61, 0x6e, 0x6e, 0x65, 0x72, 0x49, 0x6d, 0x61,
	0x67, 0x65, 0x22, 0x68, 0x0a, 0x0c, 0x50, 0x6f, 0x6c, 0x6c, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f,
	0x72, 0x79, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x02,
	0x69, 0x64, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x20, 0x0a, 0x0b, 0x62, 0x61, 0x6e, 0x6e, 0x65, 0x72,
	0x49, 0x6d, 0x61, 0x67, 0x65, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x62, 0x61, 0x6e,
	0x6e, 0x65, 0x72, 0x49, 0x6d, 0x61, 0x67, 0x65, 0x12, 0x12, 0x0a, 0x04, 0x70, 0x6f, 0x6c, 0x6c,
	0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x70, 0x6f, 0x6c, 0x6c, 0x22, 0x5f, 0x0a, 0x0d,
	0x50, 0x6f, 0x6c, 0x6c, 0x43, 0x61, 0x6e, 0x64, 0x69, 0x64, 0x61, 0x74, 0x65, 0x12, 0x1c, 0x0a,
	0x09, 0x63, 0x61, 0x6e, 0x64, 0x69, 0x64, 0x61, 0x74, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x09, 0x63, 0x61, 0x6e, 0x64, 0x69, 0x64, 0x61, 0x74, 0x65, 0x12, 0x1a, 0x0a, 0x08, 0x63,
	0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x63,
	0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x12, 0x14, 0x0a, 0x05, 0x76, 0x6f, 0x74, 0x65, 0x73,
	0x18, 0x03, 0x20, 0x03, 0x28, 0x09, 0x52, 0x05, 0x76, 0x6f, 0x74, 0x65, 0x73, 0x22, 0x37, 0x0a,
	0x10, 0x47, 0x65, 0x74, 0x50, 0x6f, 0x6c, 0x6c, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x12, 0x23, 0x0a, 0x05, 0x70, 0x6f, 0x6c, 0x6c, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b,
	0x32, 0x0d, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x50, 0x6f, 0x6c, 0x6c, 0x52,
	0x05, 0x70, 0x6f, 0x6c, 0x6c, 0x73, 0x22, 0x72, 0x0a, 0x0f, 0x47, 0x65, 0x74, 0x50, 0x6f, 0x6c,
	0x6c, 0x73, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x2b, 0x0a, 0x06, 0x73, 0x74, 0x61,
	0x74, 0x75, 0x73, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0e, 0x32, 0x13, 0x2e, 0x63, 0x72, 0x6f, 0x77,
	0x64, 0x65, 0x72, 0x2e, 0x50, 0x6f, 0x6c, 0x6c, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x52, 0x06,
	0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x12, 0x16, 0x0a, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64,
	0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x12, 0x1a,
	0x0a, 0x08, 0x75, 0x73, 0x65, 0x72, 0x54, 0x79, 0x70, 0x65, 0x18, 0x03, 0x20, 0x01, 0x28, 0x05,
	0x52, 0x08, 0x75, 0x73, 0x65, 0x72, 0x54, 0x79, 0x70, 0x65, 0x22, 0x2a, 0x0a, 0x14, 0x47, 0x65,
	0x74, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x69, 0x65, 0x73, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x12, 0x12, 0x0a, 0x04, 0x70, 0x6f, 0x6c, 0x6c, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x04, 0x70, 0x6f, 0x6c, 0x6c, 0x22, 0x26, 0x0a, 0x14, 0x47, 0x65, 0x74, 0x56, 0x6f, 0x74,
	0x69, 0x6e, 0x67, 0x49, 0x74, 0x65, 0x6d, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x0e,
	0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x02, 0x69, 0x64, 0x22, 0x4e,
	0x0a, 0x15, 0x47, 0x65, 0x74, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x69, 0x65, 0x73, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x35, 0x0a, 0x0a, 0x63, 0x61, 0x74, 0x65, 0x67,
	0x6f, 0x72, 0x69, 0x65, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x15, 0x2e, 0x63, 0x72,
	0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x50, 0x6f, 0x6c, 0x6c, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f,
	0x72, 0x79, 0x52, 0x0a, 0x63, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x69, 0x65, 0x73, 0x22, 0x29,
	0x0a, 0x17, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x56, 0x6f, 0x74, 0x69, 0x6e, 0x67, 0x49, 0x74,
	0x65, 0x6d, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18,
	0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x02, 0x69, 0x64, 0x22, 0xa0, 0x01, 0x0a, 0x0e, 0x56, 0x6f,
	0x74, 0x69, 0x6e, 0x67, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x1e, 0x0a, 0x0a,
	0x73, 0x75, 0x63, 0x63, 0x65, 0x73, 0x73, 0x66, 0x75, 0x6c, 0x18, 0x01, 0x20, 0x01, 0x28, 0x08,
	0x52, 0x0a, 0x73, 0x75, 0x63, 0x63, 0x65, 0x73, 0x73, 0x66, 0x75, 0x6c, 0x12, 0x18, 0x0a, 0x07,
	0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x6d,
	0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x12, 0x21, 0x0a, 0x04, 0x70, 0x6f, 0x6c, 0x6c, 0x18, 0x03,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x0d, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x50,
	0x6f, 0x6c, 0x6c, 0x52, 0x04, 0x70, 0x6f, 0x6c, 0x6c, 0x12, 0x31, 0x0a, 0x08, 0x63, 0x61, 0x74,
	0x65, 0x67, 0x6f, 0x72, 0x79, 0x18, 0x04, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x15, 0x2e, 0x63, 0x72,
	0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x50, 0x6f, 0x6c, 0x6c, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f,
	0x72, 0x79, 0x52, 0x08, 0x63, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x2a, 0x3f, 0x0a, 0x0a,
	0x50, 0x6f, 0x6c, 0x6c, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x12, 0x0b, 0x0a, 0x07, 0x75, 0x6e,
	0x6b, 0x6e, 0x6f, 0x77, 0x6e, 0x10, 0x00, 0x12, 0x0b, 0x0a, 0x07, 0x70, 0x65, 0x6e, 0x64, 0x69,
	0x6e, 0x67, 0x10, 0x01, 0x12, 0x0a, 0x0a, 0x06, 0x61, 0x63, 0x74, 0x69, 0x76, 0x65, 0x10, 0x02,
	0x12, 0x0b, 0x0a, 0x07, 0x65, 0x78, 0x70, 0x69, 0x72, 0x65, 0x64, 0x10, 0x03, 0x32, 0xfc, 0x05,
	0x0a, 0x09, 0x56, 0x6f, 0x74, 0x69, 0x6e, 0x67, 0x53, 0x76, 0x63, 0x12, 0x34, 0x0a, 0x0a, 0x63,
	0x72, 0x65, 0x61, 0x74, 0x65, 0x50, 0x6f, 0x6c, 0x6c, 0x12, 0x0d, 0x2e, 0x63, 0x72, 0x6f, 0x77,
	0x64, 0x65, 0x72, 0x2e, 0x50, 0x6f, 0x6c, 0x6c, 0x1a, 0x17, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64,
	0x65, 0x72, 0x2e, 0x56, 0x6f, 0x74, 0x69, 0x6e, 0x67, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x12, 0x34, 0x0a, 0x0a, 0x75, 0x70, 0x64, 0x61, 0x74, 0x65, 0x50, 0x6f, 0x6c, 0x6c, 0x12,
	0x0d, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x50, 0x6f, 0x6c, 0x6c, 0x1a, 0x17,
	0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x56, 0x6f, 0x74, 0x69, 0x6e, 0x67, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x47, 0x0a, 0x0a, 0x64, 0x65, 0x6c, 0x65, 0x74,
	0x65, 0x50, 0x6f, 0x6c, 0x6c, 0x12, 0x20, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e,
	0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x56, 0x6f, 0x74, 0x69, 0x6e, 0x67, 0x49, 0x74, 0x65, 0x6d,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x17, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65,
	0x72, 0x2e, 0x56, 0x6f, 0x74, 0x69, 0x6e, 0x67, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x12, 0x41, 0x0a, 0x08, 0x67, 0x65, 0x74, 0x50, 0x6f, 0x6c, 0x6c, 0x73, 0x12, 0x18, 0x2e, 0x63,
	0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x47, 0x65, 0x74, 0x50, 0x6f, 0x6c, 0x6c, 0x73, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x19, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72,
	0x2e, 0x47, 0x65, 0x74, 0x50, 0x6f, 0x6c, 0x6c, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x30, 0x01, 0x12, 0x43, 0x0a, 0x07, 0x67, 0x65, 0x74, 0x50, 0x6f, 0x6c, 0x6c, 0x12, 0x1d,
	0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x47, 0x65, 0x74, 0x56, 0x6f, 0x74, 0x69,
	0x6e, 0x67, 0x49, 0x74, 0x65, 0x6d, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x17, 0x2e,
	0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x56, 0x6f, 0x74, 0x69, 0x6e, 0x67, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x30, 0x01, 0x12, 0x48, 0x0a, 0x0f, 0x67, 0x65, 0x74, 0x50,
	0x6f, 0x6c, 0x6c, 0x73, 0x46, 0x6f, 0x72, 0x55, 0x73, 0x65, 0x72, 0x12, 0x18, 0x2e, 0x63, 0x72,
	0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x47, 0x65, 0x74, 0x50, 0x6f, 0x6c, 0x6c, 0x73, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x19, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e,
	0x47, 0x65, 0x74, 0x50, 0x6f, 0x6c, 0x6c, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x30, 0x01, 0x12, 0x40, 0x0a, 0x0e, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65, 0x43, 0x61, 0x74, 0x65,
	0x67, 0x6f, 0x72, 0x79, 0x12, 0x15, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x50,
	0x6f, 0x6c, 0x6c, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x1a, 0x17, 0x2e, 0x63, 0x72,
	0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x56, 0x6f, 0x74, 0x69, 0x6e, 0x67, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x73, 0x65, 0x12, 0x40, 0x0a, 0x0e, 0x75, 0x70, 0x64, 0x61, 0x74, 0x65, 0x43, 0x61,
	0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x12, 0x15, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72,
	0x2e, 0x50, 0x6f, 0x6c, 0x6c, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x1a, 0x17, 0x2e,
	0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x56, 0x6f, 0x74, 0x69, 0x6e, 0x67, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x4b, 0x0a, 0x0e, 0x64, 0x65, 0x6c, 0x65, 0x74, 0x65,
	0x43, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x12, 0x20, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64,
	0x65, 0x72, 0x2e, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x56, 0x6f, 0x74, 0x69, 0x6e, 0x67, 0x49,
	0x74, 0x65, 0x6d, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x17, 0x2e, 0x63, 0x72, 0x6f,
	0x77, 0x64, 0x65, 0x72, 0x2e, 0x56, 0x6f, 0x74, 0x69, 0x6e, 0x67, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x12, 0x45, 0x0a, 0x0b, 0x67, 0x65, 0x74, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f,
	0x72, 0x79, 0x12, 0x1d, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x47, 0x65, 0x74,
	0x56, 0x6f, 0x74, 0x69, 0x6e, 0x67, 0x49, 0x74, 0x65, 0x6d, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x1a, 0x17, 0x2e, 0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x56, 0x6f, 0x74, 0x69,
	0x6e, 0x67, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x50, 0x0a, 0x0d, 0x67, 0x65,
	0x74, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x69, 0x65, 0x73, 0x12, 0x1d, 0x2e, 0x63, 0x72,
	0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x47, 0x65, 0x74, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72,
	0x69, 0x65, 0x73, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x1e, 0x2e, 0x63, 0x72, 0x6f,
	0x77, 0x64, 0x65, 0x72, 0x2e, 0x47, 0x65, 0x74, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x69,
	0x65, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x30, 0x01, 0x42, 0x10, 0x5a, 0x0e,
	0x63, 0x72, 0x6f, 0x77, 0x64, 0x65, 0x72, 0x2e, 0x63, 0x6f, 0x6d, 0x3b, 0x6d, 0x73, 0x62, 0x06,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_voting_proto_rawDescOnce sync.Once
	file_voting_proto_rawDescData = file_voting_proto_rawDesc
)

func file_voting_proto_rawDescGZIP() []byte {
	file_voting_proto_rawDescOnce.Do(func() {
		file_voting_proto_rawDescData = protoimpl.X.CompressGZIP(file_voting_proto_rawDescData)
	})
	return file_voting_proto_rawDescData
}

var file_voting_proto_enumTypes = make([]protoimpl.EnumInfo, 1)
var file_voting_proto_msgTypes = make([]protoimpl.MessageInfo, 10)
var file_voting_proto_goTypes = []interface{}{
	(PollStatus)(0),                 // 0: crowder.PollStatus
	(*Poll)(nil),                    // 1: crowder.Poll
	(*PollCategory)(nil),            // 2: crowder.PollCategory
	(*PollCandidate)(nil),           // 3: crowder.PollCandidate
	(*GetPollsResponse)(nil),        // 4: crowder.GetPollsResponse
	(*GetPollsRequest)(nil),         // 5: crowder.GetPollsRequest
	(*GetCategoriesRequest)(nil),    // 6: crowder.GetCategoriesRequest
	(*GetVotingItemRequest)(nil),    // 7: crowder.GetVotingItemRequest
	(*GetCategoriesResponse)(nil),   // 8: crowder.GetCategoriesResponse
	(*DeleteVotingItemRequest)(nil), // 9: crowder.DeleteVotingItemRequest
	(*VotingResponse)(nil),          // 10: crowder.VotingResponse
	(*timestamppb.Timestamp)(nil),   // 11: google.protobuf.Timestamp
}
var file_voting_proto_depIdxs = []int32{
	0,  // 0: crowder.Poll.status:type_name -> crowder.PollStatus
	3,  // 1: crowder.Poll.candidates:type_name -> crowder.PollCandidate
	11, // 2: crowder.Poll.startTimestamp:type_name -> google.protobuf.Timestamp
	11, // 3: crowder.Poll.endTimestamp:type_name -> google.protobuf.Timestamp
	1,  // 4: crowder.GetPollsResponse.polls:type_name -> crowder.Poll
	0,  // 5: crowder.GetPollsRequest.status:type_name -> crowder.PollStatus
	2,  // 6: crowder.GetCategoriesResponse.categories:type_name -> crowder.PollCategory
	1,  // 7: crowder.VotingResponse.poll:type_name -> crowder.Poll
	2,  // 8: crowder.VotingResponse.category:type_name -> crowder.PollCategory
	1,  // 9: crowder.VotingSvc.createPoll:input_type -> crowder.Poll
	1,  // 10: crowder.VotingSvc.updatePoll:input_type -> crowder.Poll
	9,  // 11: crowder.VotingSvc.deletePoll:input_type -> crowder.DeleteVotingItemRequest
	5,  // 12: crowder.VotingSvc.getPolls:input_type -> crowder.GetPollsRequest
	7,  // 13: crowder.VotingSvc.getPoll:input_type -> crowder.GetVotingItemRequest
	5,  // 14: crowder.VotingSvc.getPollsForUser:input_type -> crowder.GetPollsRequest
	2,  // 15: crowder.VotingSvc.createCategory:input_type -> crowder.PollCategory
	2,  // 16: crowder.VotingSvc.updateCategory:input_type -> crowder.PollCategory
	9,  // 17: crowder.VotingSvc.deleteCategory:input_type -> crowder.DeleteVotingItemRequest
	7,  // 18: crowder.VotingSvc.getCategory:input_type -> crowder.GetVotingItemRequest
	6,  // 19: crowder.VotingSvc.getCategories:input_type -> crowder.GetCategoriesRequest
	10, // 20: crowder.VotingSvc.createPoll:output_type -> crowder.VotingResponse
	10, // 21: crowder.VotingSvc.updatePoll:output_type -> crowder.VotingResponse
	10, // 22: crowder.VotingSvc.deletePoll:output_type -> crowder.VotingResponse
	4,  // 23: crowder.VotingSvc.getPolls:output_type -> crowder.GetPollsResponse
	10, // 24: crowder.VotingSvc.getPoll:output_type -> crowder.VotingResponse
	4,  // 25: crowder.VotingSvc.getPollsForUser:output_type -> crowder.GetPollsResponse
	10, // 26: crowder.VotingSvc.createCategory:output_type -> crowder.VotingResponse
	10, // 27: crowder.VotingSvc.updateCategory:output_type -> crowder.VotingResponse
	10, // 28: crowder.VotingSvc.deleteCategory:output_type -> crowder.VotingResponse
	10, // 29: crowder.VotingSvc.getCategory:output_type -> crowder.VotingResponse
	8,  // 30: crowder.VotingSvc.getCategories:output_type -> crowder.GetCategoriesResponse
	20, // [20:31] is the sub-list for method output_type
	9,  // [9:20] is the sub-list for method input_type
	9,  // [9:9] is the sub-list for extension type_name
	9,  // [9:9] is the sub-list for extension extendee
	0,  // [0:9] is the sub-list for field type_name
}

func init() { file_voting_proto_init() }
func file_voting_proto_init() {
	if File_voting_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_voting_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Poll); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_voting_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*PollCategory); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_voting_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*PollCandidate); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_voting_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetPollsResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_voting_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetPollsRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_voting_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetCategoriesRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_voting_proto_msgTypes[6].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetVotingItemRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_voting_proto_msgTypes[7].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetCategoriesResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_voting_proto_msgTypes[8].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DeleteVotingItemRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_voting_proto_msgTypes[9].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*VotingResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_voting_proto_rawDesc,
			NumEnums:      1,
			NumMessages:   10,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_voting_proto_goTypes,
		DependencyIndexes: file_voting_proto_depIdxs,
		EnumInfos:         file_voting_proto_enumTypes,
		MessageInfos:      file_voting_proto_msgTypes,
	}.Build()
	File_voting_proto = out.File
	file_voting_proto_rawDesc = nil
	file_voting_proto_goTypes = nil
	file_voting_proto_depIdxs = nil
}

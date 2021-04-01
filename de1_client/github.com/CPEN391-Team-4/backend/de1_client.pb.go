// Code generated by protoc-gen-go. DO NOT EDIT.
// source: de1_client.proto

package backend

import (
	fmt "fmt"
	proto "github.com/golang/protobuf/proto"
	math "math"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.ProtoPackageIsVersion3 // please upgrade the proto package

type User struct {
	Name                 string   `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	Restricted           bool     `protobuf:"varint,2,opt,name=restricted,proto3" json:"restricted,omitempty"`
	Photo                *Photo   `protobuf:"bytes,3,opt,name=Photo,proto3" json:"Photo,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *User) Reset()         { *m = User{} }
func (m *User) String() string { return proto.CompactTextString(m) }
func (*User) ProtoMessage()    {}
func (*User) Descriptor() ([]byte, []int) {
	return fileDescriptor_b03098d41fe7a1f6, []int{0}
}

func (m *User) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_User.Unmarshal(m, b)
}
func (m *User) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_User.Marshal(b, m, deterministic)
}
func (m *User) XXX_Merge(src proto.Message) {
	xxx_messageInfo_User.Merge(m, src)
}
func (m *User) XXX_Size() int {
	return xxx_messageInfo_User.Size(m)
}
func (m *User) XXX_DiscardUnknown() {
	xxx_messageInfo_User.DiscardUnknown(m)
}

var xxx_messageInfo_User proto.InternalMessageInfo

func (m *User) GetName() string {
	if m != nil {
		return m.Name
	}
	return ""
}

func (m *User) GetRestricted() bool {
	if m != nil {
		return m.Restricted
	}
	return false
}

func (m *User) GetPhoto() *Photo {
	if m != nil {
		return m.Photo
	}
	return nil
}

type Photo struct {
	Image                []byte   `protobuf:"bytes,1,opt,name=image,proto3" json:"image,omitempty"`
	FileExtension        string   `protobuf:"bytes,2,opt,name=fileExtension,proto3" json:"fileExtension,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *Photo) Reset()         { *m = Photo{} }
func (m *Photo) String() string { return proto.CompactTextString(m) }
func (*Photo) ProtoMessage()    {}
func (*Photo) Descriptor() ([]byte, []int) {
	return fileDescriptor_b03098d41fe7a1f6, []int{1}
}

func (m *Photo) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Photo.Unmarshal(m, b)
}
func (m *Photo) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Photo.Marshal(b, m, deterministic)
}
func (m *Photo) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Photo.Merge(m, src)
}
func (m *Photo) XXX_Size() int {
	return xxx_messageInfo_Photo.Size(m)
}
func (m *Photo) XXX_DiscardUnknown() {
	xxx_messageInfo_Photo.DiscardUnknown(m)
}

var xxx_messageInfo_Photo proto.InternalMessageInfo

func (m *Photo) GetImage() []byte {
	if m != nil {
		return m.Image
	}
	return nil
}

func (m *Photo) GetFileExtension() string {
	if m != nil {
		return m.FileExtension
	}
	return ""
}

type UserNames struct {
	Usernames            []string `protobuf:"bytes,1,rep,name=usernames,proto3" json:"usernames,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *UserNames) Reset()         { *m = UserNames{} }
func (m *UserNames) String() string { return proto.CompactTextString(m) }
func (*UserNames) ProtoMessage()    {}
func (*UserNames) Descriptor() ([]byte, []int) {
	return fileDescriptor_b03098d41fe7a1f6, []int{2}
}

func (m *UserNames) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_UserNames.Unmarshal(m, b)
}
func (m *UserNames) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_UserNames.Marshal(b, m, deterministic)
}
func (m *UserNames) XXX_Merge(src proto.Message) {
	xxx_messageInfo_UserNames.Merge(m, src)
}
func (m *UserNames) XXX_Size() int {
	return xxx_messageInfo_UserNames.Size(m)
}
func (m *UserNames) XXX_DiscardUnknown() {
	xxx_messageInfo_UserNames.DiscardUnknown(m)
}

var xxx_messageInfo_UserNames proto.InternalMessageInfo

func (m *UserNames) GetUsernames() []string {
	if m != nil {
		return m.Usernames
	}
	return nil
}

type Empty struct {
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *Empty) Reset()         { *m = Empty{} }
func (m *Empty) String() string { return proto.CompactTextString(m) }
func (*Empty) ProtoMessage()    {}
func (*Empty) Descriptor() ([]byte, []int) {
	return fileDescriptor_b03098d41fe7a1f6, []int{3}
}

func (m *Empty) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Empty.Unmarshal(m, b)
}
func (m *Empty) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Empty.Marshal(b, m, deterministic)
}
func (m *Empty) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Empty.Merge(m, src)
}
func (m *Empty) XXX_Size() int {
	return xxx_messageInfo_Empty.Size(m)
}
func (m *Empty) XXX_DiscardUnknown() {
	xxx_messageInfo_Empty.DiscardUnknown(m)
}

var xxx_messageInfo_Empty proto.InternalMessageInfo

type FaceVerificationReq struct {
	Photo                *Photo   `protobuf:"bytes,1,opt,name=Photo,proto3" json:"Photo,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *FaceVerificationReq) Reset()         { *m = FaceVerificationReq{} }
func (m *FaceVerificationReq) String() string { return proto.CompactTextString(m) }
func (*FaceVerificationReq) ProtoMessage()    {}
func (*FaceVerificationReq) Descriptor() ([]byte, []int) {
	return fileDescriptor_b03098d41fe7a1f6, []int{4}
}

func (m *FaceVerificationReq) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_FaceVerificationReq.Unmarshal(m, b)
}
func (m *FaceVerificationReq) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_FaceVerificationReq.Marshal(b, m, deterministic)
}
func (m *FaceVerificationReq) XXX_Merge(src proto.Message) {
	xxx_messageInfo_FaceVerificationReq.Merge(m, src)
}
func (m *FaceVerificationReq) XXX_Size() int {
	return xxx_messageInfo_FaceVerificationReq.Size(m)
}
func (m *FaceVerificationReq) XXX_DiscardUnknown() {
	xxx_messageInfo_FaceVerificationReq.DiscardUnknown(m)
}

var xxx_messageInfo_FaceVerificationReq proto.InternalMessageInfo

func (m *FaceVerificationReq) GetPhoto() *Photo {
	if m != nil {
		return m.Photo
	}
	return nil
}

type FaceVerificationResp struct {
	User                 string   `protobuf:"bytes,1,opt,name=user,proto3" json:"user,omitempty"`
	Confidence           float32  `protobuf:"fixed32,2,opt,name=confidence,proto3" json:"confidence,omitempty"`
	Accept               bool     `protobuf:"varint,3,opt,name=accept,proto3" json:"accept,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *FaceVerificationResp) Reset()         { *m = FaceVerificationResp{} }
func (m *FaceVerificationResp) String() string { return proto.CompactTextString(m) }
func (*FaceVerificationResp) ProtoMessage()    {}
func (*FaceVerificationResp) Descriptor() ([]byte, []int) {
	return fileDescriptor_b03098d41fe7a1f6, []int{5}
}

func (m *FaceVerificationResp) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_FaceVerificationResp.Unmarshal(m, b)
}
func (m *FaceVerificationResp) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_FaceVerificationResp.Marshal(b, m, deterministic)
}
func (m *FaceVerificationResp) XXX_Merge(src proto.Message) {
	xxx_messageInfo_FaceVerificationResp.Merge(m, src)
}
func (m *FaceVerificationResp) XXX_Size() int {
	return xxx_messageInfo_FaceVerificationResp.Size(m)
}
func (m *FaceVerificationResp) XXX_DiscardUnknown() {
	xxx_messageInfo_FaceVerificationResp.DiscardUnknown(m)
}

var xxx_messageInfo_FaceVerificationResp proto.InternalMessageInfo

func (m *FaceVerificationResp) GetUser() string {
	if m != nil {
		return m.User
	}
	return ""
}

func (m *FaceVerificationResp) GetConfidence() float32 {
	if m != nil {
		return m.Confidence
	}
	return 0
}

func (m *FaceVerificationResp) GetAccept() bool {
	if m != nil {
		return m.Accept
	}
	return false
}

type HistoryRecord struct {
	Name                 string   `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	Status               string   `protobuf:"bytes,2,opt,name=status,proto3" json:"status,omitempty"`
	Photo                *Photo   `protobuf:"bytes,3,opt,name=Photo,proto3" json:"Photo,omitempty"`
	Time                 string   `protobuf:"bytes,4,opt,name=time,proto3" json:"time,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *HistoryRecord) Reset()         { *m = HistoryRecord{} }
func (m *HistoryRecord) String() string { return proto.CompactTextString(m) }
func (*HistoryRecord) ProtoMessage()    {}
func (*HistoryRecord) Descriptor() ([]byte, []int) {
	return fileDescriptor_b03098d41fe7a1f6, []int{6}
}

func (m *HistoryRecord) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_HistoryRecord.Unmarshal(m, b)
}
func (m *HistoryRecord) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_HistoryRecord.Marshal(b, m, deterministic)
}
func (m *HistoryRecord) XXX_Merge(src proto.Message) {
	xxx_messageInfo_HistoryRecord.Merge(m, src)
}
func (m *HistoryRecord) XXX_Size() int {
	return xxx_messageInfo_HistoryRecord.Size(m)
}
func (m *HistoryRecord) XXX_DiscardUnknown() {
	xxx_messageInfo_HistoryRecord.DiscardUnknown(m)
}

var xxx_messageInfo_HistoryRecord proto.InternalMessageInfo

func (m *HistoryRecord) GetName() string {
	if m != nil {
		return m.Name
	}
	return ""
}

func (m *HistoryRecord) GetStatus() string {
	if m != nil {
		return m.Status
	}
	return ""
}

func (m *HistoryRecord) GetPhoto() *Photo {
	if m != nil {
		return m.Photo
	}
	return nil
}

func (m *HistoryRecord) GetTime() string {
	if m != nil {
		return m.Time
	}
	return ""
}

type Timestamp struct {
	Starttime            string   `protobuf:"bytes,1,opt,name=starttime,proto3" json:"starttime,omitempty"`
	Endtime              string   `protobuf:"bytes,2,opt,name=endtime,proto3" json:"endtime,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *Timestamp) Reset()         { *m = Timestamp{} }
func (m *Timestamp) String() string { return proto.CompactTextString(m) }
func (*Timestamp) ProtoMessage()    {}
func (*Timestamp) Descriptor() ([]byte, []int) {
	return fileDescriptor_b03098d41fe7a1f6, []int{7}
}

func (m *Timestamp) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Timestamp.Unmarshal(m, b)
}
func (m *Timestamp) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Timestamp.Marshal(b, m, deterministic)
}
func (m *Timestamp) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Timestamp.Merge(m, src)
}
func (m *Timestamp) XXX_Size() int {
	return xxx_messageInfo_Timestamp.Size(m)
}
func (m *Timestamp) XXX_DiscardUnknown() {
	xxx_messageInfo_Timestamp.DiscardUnknown(m)
}

var xxx_messageInfo_Timestamp proto.InternalMessageInfo

func (m *Timestamp) GetStarttime() string {
	if m != nil {
		return m.Starttime
	}
	return ""
}

func (m *Timestamp) GetEndtime() string {
	if m != nil {
		return m.Endtime
	}
	return ""
}

type Permission struct {
	Usernames            string   `protobuf:"bytes,1,opt,name=usernames,proto3" json:"usernames,omitempty"`
	Userid               int64    `protobuf:"varint,2,opt,name=userid,proto3" json:"userid,omitempty"`
	Permit               bool     `protobuf:"varint,3,opt,name=permit,proto3" json:"permit,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *Permission) Reset()         { *m = Permission{} }
func (m *Permission) String() string { return proto.CompactTextString(m) }
func (*Permission) ProtoMessage()    {}
func (*Permission) Descriptor() ([]byte, []int) {
	return fileDescriptor_b03098d41fe7a1f6, []int{8}
}

func (m *Permission) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Permission.Unmarshal(m, b)
}
func (m *Permission) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Permission.Marshal(b, m, deterministic)
}
func (m *Permission) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Permission.Merge(m, src)
}
func (m *Permission) XXX_Size() int {
	return xxx_messageInfo_Permission.Size(m)
}
func (m *Permission) XXX_DiscardUnknown() {
	xxx_messageInfo_Permission.DiscardUnknown(m)
}

var xxx_messageInfo_Permission proto.InternalMessageInfo

func (m *Permission) GetUsernames() string {
	if m != nil {
		return m.Usernames
	}
	return ""
}

func (m *Permission) GetUserid() int64 {
	if m != nil {
		return m.Userid
	}
	return 0
}

func (m *Permission) GetPermit() bool {
	if m != nil {
		return m.Permit
	}
	return false
}

func init() {
	proto.RegisterType((*User)(nil), "de1_client.User")
	proto.RegisterType((*Photo)(nil), "de1_client.Photo")
	proto.RegisterType((*UserNames)(nil), "de1_client.UserNames")
	proto.RegisterType((*Empty)(nil), "de1_client.Empty")
	proto.RegisterType((*FaceVerificationReq)(nil), "de1_client.FaceVerificationReq")
	proto.RegisterType((*FaceVerificationResp)(nil), "de1_client.FaceVerificationResp")
	proto.RegisterType((*HistoryRecord)(nil), "de1_client.HistoryRecord")
	proto.RegisterType((*Timestamp)(nil), "de1_client.Timestamp")
	proto.RegisterType((*Permission)(nil), "de1_client.Permission")
}

func init() { proto.RegisterFile("de1_client.proto", fileDescriptor_b03098d41fe7a1f6) }

var fileDescriptor_b03098d41fe7a1f6 = []byte{
	// 580 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x9c, 0x54, 0xef, 0x4f, 0x13, 0x41,
	0x10, 0xe5, 0xa0, 0x05, 0x6e, 0x84, 0x0a, 0x2b, 0x92, 0xb3, 0x31, 0x5a, 0x4f, 0x13, 0xeb, 0x07,
	0x40, 0xc0, 0xc4, 0x40, 0xd4, 0x04, 0x09, 0x56, 0x8d, 0x21, 0x64, 0x03, 0x9a, 0xf0, 0xc5, 0x6c,
	0xf7, 0xa6, 0xb0, 0xb1, 0x77, 0x7b, 0xde, 0x4e, 0x09, 0xfd, 0x3f, 0xfd, 0x83, 0xcc, 0xee, 0x1d,
	0xed, 0x1d, 0x34, 0x62, 0xf8, 0xb6, 0xf3, 0x76, 0x76, 0x7e, 0xbc, 0xf7, 0xee, 0x60, 0x29, 0xc2,
	0xcd, 0x9f, 0xb2, 0xaf, 0x30, 0xa1, 0xf5, 0x34, 0xd3, 0xa4, 0x19, 0x8c, 0x91, 0x50, 0x42, 0xed,
	0xc4, 0x60, 0xc6, 0x18, 0xd4, 0x12, 0x11, 0x63, 0xe0, 0xb5, 0xbc, 0xb6, 0xcf, 0xdd, 0x99, 0x3d,
	0x01, 0xc8, 0xd0, 0x50, 0xa6, 0x24, 0x61, 0x14, 0x4c, 0xb7, 0xbc, 0xf6, 0x3c, 0x2f, 0x21, 0xec,
	0x25, 0xd4, 0x8f, 0xce, 0x35, 0xe9, 0x60, 0xa6, 0xe5, 0xb5, 0xef, 0x6d, 0x2d, 0xaf, 0x97, 0x3a,
	0xb9, 0x0b, 0x9e, 0xdf, 0x87, 0xfb, 0x45, 0x22, 0x5b, 0x81, 0xba, 0x8a, 0xc5, 0x59, 0xde, 0x66,
	0x81, 0xe7, 0x01, 0x7b, 0x01, 0x8b, 0x3d, 0xd5, 0xc7, 0x83, 0x4b, 0xc2, 0xc4, 0x28, 0x9d, 0xb8,
	0x56, 0x3e, 0xaf, 0x82, 0xe1, 0x2b, 0xf0, 0xed, 0xa4, 0x87, 0x22, 0x46, 0xc3, 0x1e, 0x83, 0x3f,
	0x30, 0x98, 0xd9, 0x31, 0x4d, 0xe0, 0xb5, 0x66, 0xda, 0x3e, 0x1f, 0x03, 0xe1, 0x1c, 0xd4, 0x0f,
	0xe2, 0x94, 0x86, 0xe1, 0x07, 0x78, 0xf0, 0x49, 0x48, 0xfc, 0x8e, 0x99, 0xea, 0x29, 0x29, 0x48,
	0xe9, 0x84, 0xe3, 0xef, 0xf1, 0xe0, 0xde, 0x2d, 0x83, 0x77, 0x61, 0xe5, 0xe6, 0x7b, 0x93, 0x5a,
	0xb6, 0x6c, 0xb7, 0x2b, 0xb6, 0xec, 0xd9, 0xb2, 0x25, 0x75, 0xd2, 0x53, 0x11, 0x26, 0x12, 0xdd,
	0x0a, 0xd3, 0xbc, 0x84, 0xb0, 0x55, 0x98, 0x15, 0x52, 0x62, 0x4a, 0x8e, 0xae, 0x79, 0x5e, 0x44,
	0xe1, 0x25, 0x2c, 0x7e, 0x56, 0x86, 0x74, 0x36, 0xe4, 0x28, 0x75, 0x16, 0x4d, 0x94, 0x62, 0x15,
	0x66, 0x0d, 0x09, 0x1a, 0x98, 0x82, 0x9b, 0x22, 0xfa, 0x6f, 0x09, 0x6c, 0x51, 0x52, 0x31, 0x06,
	0xb5, 0xbc, 0xa8, 0x3d, 0x87, 0xfb, 0xe0, 0x1f, 0xab, 0x18, 0x0d, 0x89, 0x38, 0xb5, 0x8c, 0x1a,
	0x12, 0x19, 0xb9, 0xac, 0xbc, 0xf5, 0x18, 0x60, 0x01, 0xcc, 0x61, 0x12, 0xb9, 0xbb, 0x7c, 0x80,
	0xab, 0x30, 0x3c, 0x05, 0x38, 0xc2, 0x2c, 0x56, 0xc6, 0x8a, 0x74, 0x5d, 0x17, 0xaf, 0xa2, 0x8b,
	0xdd, 0xc2, 0x06, 0x2a, 0x37, 0xd3, 0x0c, 0x2f, 0x22, 0x8b, 0xa7, 0xb6, 0xc6, 0x88, 0x9a, 0x3c,
	0xda, 0xfa, 0x53, 0x83, 0x3a, 0xd7, 0x03, 0x42, 0xb6, 0x03, 0x8d, 0xbd, 0x28, 0x3a, 0xce, 0x06,
	0x86, 0x30, 0x72, 0x86, 0x5d, 0x2a, 0xaf, 0x6a, 0x91, 0x66, 0x65, 0xf9, 0x5c, 0xff, 0xa9, 0xb6,
	0xc7, 0xde, 0xc1, 0xf2, 0x49, 0x1a, 0x09, 0xc2, 0x3b, 0xbd, 0xfe, 0x01, 0x0d, 0xa7, 0xfe, 0xd0,
	0x26, 0x59, 0x2f, 0xb0, 0xa7, 0xe5, 0xc4, 0x09, 0xee, 0x6a, 0xb6, 0xfe, 0x9d, 0x60, 0x52, 0x57,
	0x78, 0x17, 0x96, 0x39, 0xc6, 0xfa, 0xe2, 0x0e, 0x63, 0xb1, 0xb7, 0xb0, 0xd0, 0x41, 0xb2, 0xf7,
	0xb9, 0xb8, 0xb7, 0x3c, 0xcb, 0xbd, 0x3c, 0xf5, 0xda, 0x63, 0xef, 0xe1, 0x7e, 0x07, 0x69, 0xaf,
	0xdf, 0x1f, 0x7f, 0x49, 0x37, 0x1b, 0x34, 0x1f, 0x5e, 0x2f, 0xe7, 0x32, 0xc3, 0x29, 0xf6, 0x15,
	0x58, 0x07, 0xa9, 0xe2, 0x56, 0x8c, 0x58, 0x25, 0x7d, 0x64, 0xa8, 0xe6, 0xa3, 0x32, 0x5c, 0x79,
	0x53, 0x8c, 0xd2, 0xe8, 0xa8, 0x0b, 0x2c, 0x79, 0x67, 0xb5, 0x32, 0xf3, 0x08, 0x9f, 0x4c, 0xc1,
	0x2e, 0x34, 0x3a, 0x48, 0xdf, 0x04, 0xa1, 0xa1, 0x2f, 0xee, 0x2f, 0x32, 0x61, 0x91, 0xc9, 0x2c,
	0x7c, 0x7c, 0x7e, 0xfa, 0xec, 0x4c, 0xd1, 0xf9, 0xa0, 0xbb, 0x2e, 0x75, 0xbc, 0xb1, 0x7f, 0x74,
	0x70, 0xb8, 0xbd, 0xb3, 0xb9, 0x76, 0x8c, 0x22, 0x5e, 0x7b, 0xb3, 0xd1, 0x15, 0xf2, 0x17, 0x26,
	0x51, 0x77, 0xd6, 0xfd, 0x2b, 0xb7, 0xff, 0x06, 0x00, 0x00, 0xff, 0xff, 0x23, 0x2c, 0x43, 0x97,
	0x3f, 0x05, 0x00, 0x00,
}

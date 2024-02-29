class EnterPasscodeModel {
  String? status;
  String? statusCode;
  String? message;
  Data? data;

  EnterPasscodeModel(
      {this.status, this.statusCode, this.message, this.data,});

  EnterPasscodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? type;
  Attributes? attributes;
  String? accessToken;
  String? refreshToken;

  Data({this.type, this.attributes, this.accessToken, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}

class Attributes {
  String? sId;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? password;
  Image? image;
  String? role;
  bool? isBlocked;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? passcode;

  Attributes(
      {this.sId,
        this.fullName,
        this.email,
        this.phoneNumber,
        this.password,
        this.image,
        this.role,
        this.isBlocked,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.passcode});

  Attributes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    role = json['role'];
    isBlocked = json['isBlocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    passcode = json['passcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['role'] = this.role;
    data['isBlocked'] = this.isBlocked;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['passcode'] = this.passcode;
    return data;
  }
}

class Image {
  String? publicFileUrl;
  String? path;

  Image({this.publicFileUrl, this.path});

  Image.fromJson(Map<String, dynamic> json) {
    publicFileUrl = json['publicFileUrl'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['publicFileUrl'] = this.publicFileUrl;
    data['path'] = this.path;
    return data;
  }
}
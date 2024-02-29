class PaymentInfoModel {
  String? status;
  String? statusCode;
  String? message;
  Data? data;

  PaymentInfoModel(
      {this.status, this.statusCode, this.message, this.data});

  PaymentInfoModel.fromJson(Map<String, dynamic> json) {
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
  Attributes? attributes;

  Data({this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? sId;
  String? name;
  String? bankName;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Attributes(
      {this.sId,
        this.name,
        this.bankName,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Attributes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    bankName = json['bankName'];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['bankName'] = this.bankName;
    data['phoneNumber'] = this.phoneNumber;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
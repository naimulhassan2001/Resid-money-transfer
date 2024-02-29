class ForgetPasswordOtpModel {
  String? status;
  String? statusCode;
  String? message;
  Data? data;

  ForgetPasswordOtpModel(
      {this.status, this.statusCode, this.message, this.data});

  ForgetPasswordOtpModel.fromJson(Map<String, dynamic> json) {
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
  String? forgetPasswordToken;

  Data({this.type, this.forgetPasswordToken});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    forgetPasswordToken = json['forgetPasswordToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['forgetPasswordToken'] = this.forgetPasswordToken;
    return data;
  }
}
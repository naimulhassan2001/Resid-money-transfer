class CountryListModel {
  String? status;
  String? statusCode;
  String? message;
  Data? data;

  CountryListModel(
      {this.status, this.statusCode, this.message, this.data});

  CountryListModel.fromJson(Map<String, dynamic> json) {
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
  List<Attributes>? attributes;

  Data({this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(new Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  String? sId;
  String? name;
  String? countryCode;
  String? currency;
  String? countryFlag;
  List<PaymentGateways>? paymentGateways;
  bool? isPaymentAvailable;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Attributes(
      {this.sId,
        this.name,
        this.countryCode,
        this.currency,
        this.countryFlag,
        this.paymentGateways,
        this.isPaymentAvailable,
        this.iV,
        this.createdAt,
        this.updatedAt});

  Attributes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    countryCode = json['countryCode'];
    currency = json['currency'];
    countryFlag = json['countryFlag'];
    if (json['paymentGateways'] != null) {
      paymentGateways = <PaymentGateways>[];
      json['paymentGateways'].forEach((v) {
        paymentGateways!.add(new PaymentGateways.fromJson(v));
      });
    }
    isPaymentAvailable = json['isPaymentAvailable'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['countryCode'] = this.countryCode;
    data['currency'] = this.currency;
    data['countryFlag'] = this.countryFlag;
    if (this.paymentGateways != null) {
      data['paymentGateways'] =
          this.paymentGateways!.map((v) => v.toJson()).toList();
    }
    data['isPaymentAvailable'] = this.isPaymentAvailable;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class PaymentGateways {
  String? name;
  String? logo;
  String? sId;

  PaymentGateways({this.name, this.logo, this.sId});

  PaymentGateways.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['_id'] = this.sId;
    return data;
  }
}
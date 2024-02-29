class TransactionDetailsModel {
  String? status;
  String? statusCode;
  String? message;
  Data? data;

  TransactionDetailsModel(
      {this.status, this.statusCode, this.message, this.data,});

  TransactionDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? phoneNumber;
  int? amountToSent;
  String? ammountToSentCurrency;
  int? amountToReceive;
  String? amountToReceiveCurrency;
  String? exchangeRate;
  String? paymentMethod;
  Country? country;
  String? status;
  String? transactionId;
  Sender? sender;
  DateTime? createdAt;
  String? updatedAt;
  int? iV;

  Attributes(
      {this.sId,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.amountToSent,
        this.ammountToSentCurrency,
        this.amountToReceive,
        this.amountToReceiveCurrency,
        this.exchangeRate,
        this.paymentMethod,
        this.country,
        this.status,
        this.transactionId,
        this.sender,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Attributes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    amountToSent = json['amountToSent'];
    ammountToSentCurrency = json['ammountToSentCurrency'];
    amountToReceive = json['amountToReceive'];
    amountToReceiveCurrency = json['amountToReceiveCurrency'];
    exchangeRate = json['exchangeRate'];
    paymentMethod = json['paymentMethod'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    status = json['status'];
    transactionId = json['transactionId'];
    sender =
    json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    createdAt = json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]);
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['amountToSent'] = this.amountToSent;
    data['ammountToSentCurrency'] = this.ammountToSentCurrency;
    data['amountToReceive'] = this.amountToReceive;
    data['amountToReceiveCurrency'] = this.amountToReceiveCurrency;
    data['exchangeRate'] = this.exchangeRate;
    data['paymentMethod'] = this.paymentMethod;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['status'] = this.status;
    data['transactionId'] = this.transactionId;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Country {
  String? sId;
  String? countryFlag;

  Country({this.sId, this.countryFlag});

  Country.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    countryFlag = json['countryFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['countryFlag'] = this.countryFlag;
    return data;
  }
}

class Sender {
  String? sId;
  String? fullName;
  Image? image;

  Sender({this.sId, this.fullName, this.image});

  Sender.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
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
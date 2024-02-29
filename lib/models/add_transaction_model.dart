class AddTransactionModel {
  String? status;
  String? statusCode;
  String? message;
  Data? data;

  AddTransactionModel(
      {this.status, this.statusCode, this.message, this.data});

  AddTransactionModel.fromJson(Map<String, dynamic> json) {
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

  Data({this.type, this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  int? amountToSent;
  String? ammountToSentCurrency;
  int? amountToReceive;
  String? amountToReceiveCurrency;
  String? exchangeRate;
  int? hiddenFees;
  String? paymentMethod;
  String? country;
  bool? userConfirmation;
  String? status;
  String? sId;
  String? transactionId;
  String? sender;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Attributes(
      {this.firstName,
        this.lastName,
        this.phoneNumber,
        this.amountToSent,
        this.ammountToSentCurrency,
        this.amountToReceive,
        this.amountToReceiveCurrency,
        this.exchangeRate,
        this.hiddenFees,
        this.paymentMethod,
        this.country,
        this.userConfirmation,
        this.status,
        this.sId,
        this.transactionId,
        this.sender,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Attributes.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    amountToSent = json['amountToSent'];
    ammountToSentCurrency = json['ammountToSentCurrency'];
    amountToReceive = json['amountToReceive'];
    amountToReceiveCurrency = json['amountToReceiveCurrency'];
    exchangeRate = json['exchangeRate'];
    hiddenFees = json['hiddenFees'];
    paymentMethod = json['paymentMethod'];
    country = json['country'];
    userConfirmation = json['userConfirmation'];
    status = json['status'];
    sId = json['_id'];
    transactionId = json['transactionId'];
    sender = json['sender'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['amountToSent'] = this.amountToSent;
    data['ammountToSentCurrency'] = this.ammountToSentCurrency;
    data['amountToReceive'] = this.amountToReceive;
    data['amountToReceiveCurrency'] = this.amountToReceiveCurrency;
    data['exchangeRate'] = this.exchangeRate;
    data['hiddenFees'] = this.hiddenFees;
    data['paymentMethod'] = this.paymentMethod;
    data['country'] = this.country;
    data['userConfirmation'] = this.userConfirmation;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['transactionId'] = this.transactionId;
    data['sender'] = this.sender;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
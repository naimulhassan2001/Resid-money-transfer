class TransactionModel {
  String? status;
  String? statusCode;
  String? message;
  Data? data;

  TransactionModel(
      {this.status, this.statusCode, this.message, this.data,});

  TransactionModel.fromJson(Map<String, dynamic> json) {
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
  List<TransactionList>? transactionList;
  Pagination? pagination;

  Attributes({this.transactionList, this.pagination});

  Attributes.fromJson(Map<String, dynamic> json) {
    if (json['transactionList'] != null) {
      transactionList = <TransactionList>[];
      json['transactionList'].forEach((v) {
        transactionList!.add(new TransactionList.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transactionList != null) {
      data['transactionList'] =
          this.transactionList!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class TransactionList {
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
  bool? userConfirmation;
  String? status;
  String? transactionId;
  Map? sender;
  String? createdAt;
  String? updatedAt;
  int? iV;

  TransactionList(
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
        this.userConfirmation,
        this.status,
        this.transactionId,
        this.sender,
        this.createdAt,
        this.updatedAt,
        this.iV});

  TransactionList.fromJson(Map<String, dynamic> json) {
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
    userConfirmation = json['userConfirmation'];
    status = json['status'];
    transactionId = json['transactionId'];
    sender = json['sender'];
    createdAt = json['createdAt'];
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
    data['userConfirmation'] = this.userConfirmation;
    data['status'] = this.status;
    data['transactionId'] = this.transactionId;
    data['sender'] = this.sender;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Country {
  String? sId;
  String? name;
  String? countryFlag;

  Country({this.sId, this.name, this.countryFlag});

  Country.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    countryFlag = json['countryFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['countryFlag'] = this.countryFlag;
    return data;
  }
}

class Pagination {
  int? totalResults;
  int? totalPages;
  int? currentPage;
  int? limit;

  Pagination(
      {this.totalResults, this.totalPages, this.currentPage, this.limit});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalResults = json['totalResults'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalResults'] = this.totalResults;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    data['limit'] = this.limit;
    return data;
  }
}
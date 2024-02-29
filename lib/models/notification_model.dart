class NotificationModel {
  String? status;
  String? statusCode;
  String? message;
  Data? data;

  NotificationModel(
      {this.status, this.statusCode, this.message, this.data,});

  NotificationModel.fromJson(Map<String, dynamic> json) {
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
  List<NotificationList>? notificationList;
  Pagination? pagination;

  Attributes({this.notificationList, this.pagination});

  Attributes.fromJson(Map<String, dynamic> json) {
    if (json['notificationList'] != null) {
      notificationList = <NotificationList>[];
      json['notificationList'].forEach((v) {
        notificationList!.add(new NotificationList.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notificationList != null) {
      data['notificationList'] =
          this.notificationList!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class NotificationList {
  String? sId;
  String? message;
  String? linkId;
  String? type;
  List<String>? role;
  String? receiver;
  String? createdAt;
  String? updatedAt;
  int? iV;

  NotificationList(
      {this.sId,
        this.message,
        this.linkId,
        this.type,
        this.role,
        this.receiver,
        this.createdAt,
        this.updatedAt,
        this.iV});

  NotificationList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    message = json['message'];
    linkId = json['linkId'];
    type = json['type'];
    role = json['role'].cast<String>();
    receiver = json['receiver'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['message'] = this.message;
    data['linkId'] = this.linkId;
    data['type'] = this.type;
    data['role'] = this.role;
    data['receiver'] = this.receiver;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
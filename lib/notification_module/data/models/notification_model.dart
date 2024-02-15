import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  List<NotificationModelData>? data;
  Links? links;
  Meta? meta;
  String? message;
  int? code;
  String? type;

  NotificationModel(
      {this.data, this.links, this.meta, this.message, this.code, this.type});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NotificationModelData>[];
      json['data'].forEach((v) {
        data!.add(NotificationModelData.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    code = json['code'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    data['type'] = this.type;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data, links, meta, message, code, type];
}

class NotificationModelData {
  String? id;
  String? createdAt;
  bool? seen;
  NotificationBodyModel? body;

  NotificationModelData({this.id, this.createdAt, this.seen, this.body});

  NotificationModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    seen = json['seen'];
    body = json['body'] != null
        ? new NotificationBodyModel.fromJson(json['body'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['seen'] = this.seen;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class NotificationBodyModel {
  bool? isClickable;
  String? notificationType;
  dynamic? modelId;
  String? message;

  NotificationBodyModel(
      {this.isClickable, this.notificationType, this.modelId, this.message});

  NotificationBodyModel.fromJson(Map<String, dynamic> json) {
    isClickable = json['isClickable'];
    notificationType = json['notificationType'];
    modelId = json['modelId'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isClickable'] = this.isClickable;
    data['notificationType'] = this.notificationType;
    data['modelId'] = this.modelId;
    data['message'] = this.message;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? next;
  String? prev;

  Links({this.first, this.last, this.next, this.prev});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['next'] = this.next;
    data['prev'] = this.prev;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;

  Meta({this.currentPage, this.from, this.lastPage});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    return data;
  }
}

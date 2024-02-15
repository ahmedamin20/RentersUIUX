import '../pageination_model.dart';

/// data : [{"otherUserId":2,"name":"Customer2","lastTimeActive":null,"avatar":"https://api.pharosocail.com/storage/default/user.png","fromLoggedUser":true,"unseenMessagesCount":0,"createdAt":"2023-08-08T07:24:31.000000Z","messageBody":"هنا"}]
/// links : {"first":"https://api.pharosocail.com/api/chat/chats?page=1","last":"https://api.pharosocail.com/api/chat/chats?page=1","next":null}
/// meta : {"current_page":1,"from":1,"last_page":1}
/// message : "Data Fetched Successfully"
/// code : 200
/// type : "success"

class GetUserChatsModel {
  GetUserChatsModel({
    List<ChatUserModel>? data,
    Links? links,
    Meta? meta,
    String? message,
    num? code,
    String? type,
  }) {
    _data = data;
    _links = links;
    _meta = meta;
    _message = message;
    _code = code;
    _type = type;
  }

  GetUserChatsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ChatUserModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }

  List<ChatUserModel>? _data;
  Links? _links;
  Meta? _meta;
  String? _message;
  num? _code;
  String? _type;

  GetUserChatsModel copyWith({
    List<ChatUserModel>? data,
    Links? links,
    Meta? meta,
    String? message,
    num? code,
    String? type,
  }) =>
      GetUserChatsModel(
        data: data ?? _data,
        links: links ?? _links,
        meta: meta ?? _meta,
        message: message ?? _message,
        code: code ?? _code,
        type: type ?? _type,
      );

  List<ChatUserModel>? get data => _data;

  Links? get links => _links;

  Meta? get meta => _meta;

  String? get message => _message;

  num? get code => _code;

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_links != null) {
      map['links'] = _links?.toJson();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    map['message'] = _message;
    map['code'] = _code;
    map['type'] = _type;
    return map;
  }
}

/// otherUserId : 2
/// name : "Customer2"
/// lastTimeActive : null
/// avatar : "https://api.pharosocail.com/storage/default/user.png"
/// fromLoggedUser : true
/// unseenMessagesCount : 0
/// createdAt : "2023-08-08T07:24:31.000000Z"
/// messageBody : "هنا"

class ChatUserModel {
  ChatUserModel({
    num? otherUserId,
    String? name,
    dynamic lastTimeActive,
    String? avatar,
    bool? fromLoggedUser,
    num? unseenMessagesCount,
    String? createdAt,
    String? messageBody,
  }) {
    _otherUserId = otherUserId;
    _name = name;
    _lastTimeActive = lastTimeActive;
    _avatar = avatar;
    _fromLoggedUser = fromLoggedUser;
    _unseenMessagesCount = unseenMessagesCount;
    _createdAt = createdAt;
    _messageBody = messageBody;
  }

  ChatUserModel.fromJson(dynamic json) {
    _otherUserId = json['otherUserId'];
    _name = json['name'];
    _lastTimeActive = json['lastTimeActive'];
    _avatar = json['avatar'];
    _fromLoggedUser = json['fromLoggedUser'];
    _unseenMessagesCount = json['unseenMessagesCount'];
    _createdAt = json['createdAt'];
    _messageBody = json['messageBody'];
  }

  num? _otherUserId;
  String? _name;
  dynamic _lastTimeActive;
  String? _avatar;
  bool? _fromLoggedUser;
  num? _unseenMessagesCount;
  String? _createdAt;
  String? _messageBody;

  ChatUserModel copyWith({
    num? otherUserId,
    String? name,
    dynamic lastTimeActive,
    String? avatar,
    bool? fromLoggedUser,
    num? unseenMessagesCount,
    String? createdAt,
    String? messageBody,
  }) =>
      ChatUserModel(
        otherUserId: otherUserId ?? _otherUserId,
        name: name ?? _name,
        lastTimeActive: lastTimeActive ?? _lastTimeActive,
        avatar: avatar ?? _avatar,
        fromLoggedUser: fromLoggedUser ?? _fromLoggedUser,
        unseenMessagesCount: unseenMessagesCount ?? _unseenMessagesCount,
        createdAt: createdAt ?? _createdAt,
        messageBody: messageBody ?? _messageBody,
      );

  num? get otherUserId => _otherUserId;

  String? get name => _name;

  dynamic get lastTimeActive => _lastTimeActive;

  String? get avatar => _avatar;

  bool? get fromLoggedUser => _fromLoggedUser;

  num? get unseenMessagesCount => _unseenMessagesCount;

  String? get createdAt => _createdAt;

  String? get messageBody => _messageBody;

  set lastTimeActive(dynamic value) {
    _lastTimeActive = value;
  }

  set otherUserId(num? value) {
    _otherUserId = value;
  }

  set messageBody(String? value) {
    _messageBody = value;
  }

  set createdAt(String? value) {
    _createdAt = value;
  }

  set unseenMessagesCount(num? value) {
    _unseenMessagesCount = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otherUserId'] = _otherUserId;
    map['name'] = _name;
    map['lastTimeActive'] = _lastTimeActive;
    map['avatar'] = _avatar;
    map['fromLoggedUser'] = _fromLoggedUser;
    map['unseenMessagesCount'] = _unseenMessagesCount;
    map['createdAt'] = _createdAt;
    map['messageBody'] = _messageBody;
    return map;
  }
}

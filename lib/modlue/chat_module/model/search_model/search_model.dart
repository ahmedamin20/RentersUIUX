import '../pageination_model.dart';

/// data : [{"id":31,"name":"Amr Atef","lastTimeActive":null,"avatar":"https://api.pharosocail.com/storage/304/AAcHTtfLfTUX4h7x40YIkOMHFYO_8mplFx663lpTaZzIJDQ2i18=s96-c.jpeg"},{"id":32,"name":"amr atef","lastTimeActive":null,"avatar":"https://api.pharosocail.com/storage/306/7Xvz3fqNBLZ6bhn7.png"},{"id":33,"name":"amr atef","lastTimeActive":null,"avatar":"https://api.pharosocail.com/storage/309/rqFyhFyfenkhXKEA.png"},{"id":34,"name":"amr atef","lastTimeActive":null,"avatar":"https://api.pharosocail.com/storage/311/NEImfuSM6o1liBJs.png"},{"id":35,"name":"amr atef","lastTimeActive":null,"avatar":"https://api.pharosocail.com/storage/313/nR33Y9rtRu0yRkiy.png"},{"id":37,"name":"Amr Atef","lastTimeActive":null,"avatar":"https://api.pharosocail.com/storage/323/8gffIIxqxRSn3pZh.png"},{"id":38,"name":"Amr Atef","lastTimeActive":null,"avatar":"https://api.pharosocail.com/storage/327/ySNzvYhNd4mGZgN5.png"},{"id":40,"name":"Amr Atef","lastTimeActive":null,"avatar":"https://api.pharosocail.com/storage/392/btrM3y1cNhrGDECW.png"},{"id":41,"name":"Amr Atef","lastTimeActive":null,"avatar":"https://api.pharosocail.com/storage/394/yZYdmqIMHClYabgd.png"},{"id":42,"name":"Amr Atef","lastTimeActive":null,"avatar":"https://api.pharosocail.com/storage/396/P5i3ATIrrE9WoMwy.png"}]
/// links : {"first":"https://api.pharosocail.com/api/chat/users?page=1","last":"https://api.pharosocail.com/api/chat/users?page=1","next":null}
/// meta : {"current_page":1,"from":1,"last_page":1}
/// message : "Data Fetched Successfully"
/// code : 200
/// type : "success"

class SearchModel {
  SearchModel({
    List<SearchDataModel>? data,
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

  SearchModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SearchDataModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }

  List<SearchDataModel>? _data;
  Links? _links;
  Meta? _meta;
  String? _message;
  num? _code;
  String? _type;

  SearchModel copyWith({
    List<SearchDataModel>? data,
    Links? links,
    Meta? meta,
    String? message,
    num? code,
    String? type,
  }) =>
      SearchModel(
        data: data ?? _data,
        links: links ?? _links,
        meta: meta ?? _meta,
        message: message ?? _message,
        code: code ?? _code,
        type: type ?? _type,
      );

  List<SearchDataModel>? get data => _data;

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

/// current_page : 1
/// from : 1
/// last_page : 1

/// first : "https://api.pharosocail.com/api/chat/users?page=1"
/// last : "https://api.pharosocail.com/api/chat/users?page=1"
/// next : null

/// id : 31
/// name : "Amr Atef"
/// lastTimeActive : null
/// avatar : "https://api.pharosocail.com/storage/304/AAcHTtfLfTUX4h7x40YIkOMHFYO_8mplFx663lpTaZzIJDQ2i18=s96-c.jpeg"

class SearchDataModel {
  SearchDataModel({
    num? id,
    String? name,
    dynamic lastTimeActive,
    String? avatar,
  }) {
    _id = id;
    _name = name;
    _lastTimeActive = lastTimeActive;
    _avatar = avatar;
  }

  SearchDataModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _lastTimeActive = json['lastTimeActive'];
    _avatar = json['avatar'];
  }

  num? _id;
  String? _name;
  dynamic _lastTimeActive;
  String? _avatar;

  SearchDataModel copyWith({
    num? id,
    String? name,
    dynamic lastTimeActive,
    String? avatar,
  }) =>
      SearchDataModel(
        id: id ?? _id,
        name: name ?? _name,
        lastTimeActive: lastTimeActive ?? _lastTimeActive,
        avatar: avatar ?? _avatar,
      );

  num? get id => _id;

  String? get name => _name;

  dynamic get lastTimeActive => _lastTimeActive;

  String? get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['lastTimeActive'] = _lastTimeActive;
    map['avatar'] = _avatar;
    return map;
  }
}

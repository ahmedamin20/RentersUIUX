import '../../pageination_model.dart';
import '../attachment_response_model/attachment_response_model.dart';
import '../response_message_model/response_messaeg_model.dart';

/// data : [{"id":405,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T12:07:24.000000Z","body":"ggh","attachments":[]},{"id":404,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T12:06:52.000000Z","body":"ggh","attachments":[]},{"id":403,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T12:06:30.000000Z","body":"ggh","attachments":[]},{"id":402,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T12:04:32.000000Z","body":"ggh","attachments":[]},{"id":401,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T12:02:54.000000Z","body":"555 ll/","attachments":[]},{"id":400,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T12:02:31.000000Z","body":"555","attachments":[]},{"id":399,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T11:50:56.000000Z","body":"himgm gf pcsccccgggghgggg\n\n\nxnxbshsjsjszjjshsxbhzxhshhsjdjsie","attachments":[]},{"id":398,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T11:50:53.000000Z","body":"himgm gf pcsccccgggghgggg\n\n\nxnxbshsjsjszjjshsxbhzxhshhs","attachments":[]},{"id":397,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T11:50:52.000000Z","body":"himgm gf pcsccccgggghgggg\n\n\nxnxbshsjsjszjjshsxbhz","attachments":[]},{"id":396,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T11:50:51.000000Z","body":"himgm gf pcsccccgggghgggg\n\n\nxnxbshsjsjszjjshs","attachments":[]},{"id":395,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T11:50:49.000000Z","body":"himgm gf pcsccccgggghgggg\n\n\nxnxbshsjsjs","attachments":[]},{"id":394,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T11:50:41.000000Z","body":"himgm gf pcsccccgggghgggg","attachments":[]},{"id":393,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T11:50:41.000000Z","body":"himgm gf pcsccccgggghgggg","attachments":[]},{"id":392,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T11:50:41.000000Z","body":"himgm gf pcsccccgggghgggg","attachments":[]},{"id":391,"fromLoggedUser":true,"seen":false,"createdAt":"2023-08-07T11:50:41.000000Z","body":"himgm gf pcsccccgggghgggg","attachments":[]}]
/// links : {"first":"https://api.pharosocail.com/api/chat/messages/2?page=1","last":"https://api.pharosocail.com/api/chat/messages/2?page=8","next":"https://api.pharosocail.com/api/chat/messages/2?page=2"}
/// meta : {"current_page":1,"from":1,"last_page":8}
/// message : "Data Fetched Successfully"
/// code : 200
/// type : "success"

class GetAllMessageModel {
  GetAllMessageModel({
    List<ResponseMessageModel>? data,
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

  GetAllMessageModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ResponseMessageModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }

  List<ResponseMessageModel>? _data;
  Links? _links;
  Meta? _meta;
  String? _message;
  num? _code;
  String? _type;

  GetAllMessageModel copyWith({
    List<ResponseMessageModel>? data,
    Links? links,
    Meta? meta,
    String? message,
    num? code,
    String? type,
  }) =>
      GetAllMessageModel(
        data: data ?? _data,
        links: links ?? _links,
        meta: meta ?? _meta,
        message: message ?? _message,
        code: code ?? _code,
        type: type ?? _type,
      );

  List<ResponseMessageModel>? get data => _data;

  Links? get links => _links;

  Meta? get meta => _meta;

  String? get message => _message;

  num? get code => _code;

  String? get type => _type;
}

/// current_page : 1
/// from : 1
/// last_page : 8

/// id : 405
/// fromLoggedUser : true
/// seen : false
/// createdAt : "2023-08-07T12:07:24.000000Z"
/// body : "ggh"
/// attachments : []

class Data {
  Data({
    num? id,
    bool? fromLoggedUser,
    bool? seen,
    String? createdAt,
    String? body,
    List<Attachments>? attachments,
  }) {
    _id = id;
    _fromLoggedUser = fromLoggedUser;
    _seen = seen;
    _createdAt = createdAt;
    _body = body;
    _attachments = attachments;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _fromLoggedUser = json['fromLoggedUser'];
    _seen = json['seen'];
    _createdAt = json['createdAt'];
    _body = json['body'];
    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments?.add(Attachments.fromJson(v));
      });
    }
  }

  num? _id;
  bool? _fromLoggedUser;
  bool? _seen;
  String? _createdAt;
  String? _body;
  List<Attachments>? _attachments;

  Data copyWith({
    num? id,
    bool? fromLoggedUser,
    bool? seen,
    String? createdAt,
    String? body,
    List<Attachments>? attachments,
  }) =>
      Data(
        id: id ?? _id,
        fromLoggedUser: fromLoggedUser ?? _fromLoggedUser,
        seen: seen ?? _seen,
        createdAt: createdAt ?? _createdAt,
        body: body ?? _body,
        attachments: attachments ?? _attachments,
      );

  num? get id => _id;

  bool? get fromLoggedUser => _fromLoggedUser;

  bool? get seen => _seen;

  String? get createdAt => _createdAt;

  String? get body => _body;

  List<dynamic>? get attachments => _attachments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fromLoggedUser'] = _fromLoggedUser;
    map['seen'] = _seen;
    map['createdAt'] = _createdAt;
    map['body'] = _body;
    if (_attachments != null) {
      map['attachments'] = _attachments?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

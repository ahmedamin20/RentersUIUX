import 'package:equatable/equatable.dart';

import '../attachment_response_model/attachment_response_model.dart';

class ResponseMessageModel extends Equatable {
  ResponseMessageModel({
    dynamic? id,
    String? fromUserId,
    dynamic toUserId,
    String? body,
    bool? fromLoggedUser,
    bool? seen,
    bool? updatedBefore,
    String? createdAt,
    String? localId,
    bool isLocal = false,
    List<Attachments>? attachments,
    String? lastTimeActive,
  }) {
    _id = id;
    _fromUserId = fromUserId;
    _toUserId = toUserId;
    _body = body;
    _fromLoggedUser = fromLoggedUser;
    _seen = seen;
    _updatedBefore = updatedBefore;
    _createdAt = createdAt;
    _attachments = attachments;
    _localID = localId;
    _isLocal = isLocal;
  }

  ResponseMessageModel.fromJson(dynamic json) {
    _id = json['id'];
    _fromUserId = json['fromUserId'];
    _toUserId = json['toUserId'];
    _body = json['body'];
    _fromLoggedUser = json['fromLoggedUser'];
    _seen = json['seen'];
    _updatedBefore = json['updatedBefore'];
    _createdAt = json['createdAt'];
    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments?.add(Attachments.fromJson(v));
      });
    }
    _localID = json['localId'] ?? "";
    _isLocal = true;
    _lastTimeActive = json['lastTimeActive'];
  }

  dynamic _id;
  String? _fromUserId;
  dynamic _toUserId;
  String? _body;
  bool? _fromLoggedUser;
  bool? _seen;
  bool? _updatedBefore;
  String? _createdAt;
  List<Attachments>? _attachments;
  String? _localID;
  bool _isLocal = false;
  String? _lastTimeActive;

  ResponseMessageModel copyWith({
    num? id,
    String? fromUserId,
    dynamic toUserId,
    String? body,
    bool? fromLoggedUser,
    bool? seen,
    bool? updatedBefore,
    String? createdAt,
    List<Attachments>? attachments,
    String? localId,
    bool? isLocal,
    String? lastTimeActive,
  }) =>
      ResponseMessageModel(
        id: id ?? _id,
        fromUserId: fromUserId ?? _fromUserId,
        toUserId: toUserId ?? _toUserId,
        body: body ?? _body,
        fromLoggedUser: fromLoggedUser ?? _fromLoggedUser,
        seen: seen ?? _seen,
        updatedBefore: updatedBefore ?? _updatedBefore,
        createdAt: createdAt ?? _createdAt,
        attachments: attachments ?? _attachments,
        localId: localId ?? _localID,
        isLocal: _isLocal,
        lastTimeActive: lastTimeActive ?? _lastTimeActive,
      );

  dynamic get id => _id;

  String? get fromUserId => _fromUserId;

  dynamic get toUserId => _toUserId;

  String? get body => _body;

  bool? get fromLoggedUser => _fromLoggedUser;

  bool? get seen => _seen;

  bool? get updatedBefore => _updatedBefore;

  String? get createdAt => _createdAt;

  List<Attachments>? get attachments => _attachments;

  String? get localId => _localID;

  bool get isLocal => _isLocal;

  String? get lastTimeActive => _lastTimeActive;

// set isLocal
  set isLocal(bool value) {
    _isLocal = value;
  }

  set lastTimeActive(dynamic value) {
    _lastTimeActive = value;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        _id,
        _fromUserId,
        _toUserId,
        _body,
        _fromLoggedUser,
        _seen,
        _updatedBefore,
        _createdAt,
        _attachments,
        _localID,
        _isLocal,
      ];
}

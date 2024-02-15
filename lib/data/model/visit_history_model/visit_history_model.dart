import '../grage_model/grage_model.dart';
import '../pageination_model/pageination_model.dart';


class VisitHistoryModel {
  VisitHistoryModel({
      List<BaseVisitDataModel>? data,
      Links? links, 
      Meta? meta, 
      String? message, 
      num? code, 
      String? type,}){
    _data = data;
    _links = links;
    _meta = meta;
    _message = message;
    _code = code;
    _type = type;
}

  VisitHistoryModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BaseVisitDataModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }
  List<BaseVisitDataModel>? _data;
  Links? _links;
  Meta? _meta;
  String? _message;
  num? _code;
  String? _type;
VisitHistoryModel copyWith({  List<BaseVisitDataModel>? data,
  Links? links,
  Meta? meta,
  String? message,
  num? code,
  String? type,
}) => VisitHistoryModel(  data: data ?? _data,
  links: links ?? _links,
  meta: meta ?? _meta,
  message: message ?? _message,
  code: code ?? _code,
  type: type ?? _type,
);
  List<BaseVisitDataModel>? get data => _data;
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

class BaseVisitDataModel {
  BaseVisitDataModel({
      String? id, 
      GarageModel? garage,
      String? createdAt, 
      String? reason,}){
    _id = id;
    _garage = garage;
    _createdAt = createdAt;
    _reason = reason;
}

  BaseVisitDataModel.fromJson(dynamic json) {
    _id = json['id'];
    _garage = json['garage'] != null ? GarageModel.fromJson(json['garage']) : null;
    _createdAt = json['created_at'];
    _reason = json['reason'];
  }
  String? _id;
  GarageModel? _garage;
  String? _createdAt;
  String? _reason;
BaseVisitDataModel copyWith({  String? id,
  GarageModel? garage,
  String? createdAt,
  String? reason,
}) => BaseVisitDataModel(  id: id ?? _id,
  garage: garage ?? _garage,
  createdAt: createdAt ?? _createdAt,
  reason: reason ?? _reason,
);
  String? get id => _id;
  GarageModel? get garage => _garage;
  String? get createdAt => _createdAt;
  String? get reason => _reason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_garage != null) {
      map['garage'] = _garage?.toJson();
    }
    map['created_at'] = _createdAt;
    map['reason'] = _reason;
    return map;
  }

}

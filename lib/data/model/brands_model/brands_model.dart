/// data : [{"id":1,"name":"Naomie Price Jr."},{"id":2,"name":"New Updated Brand"},{"id":3,"name":"sd;lcsd;"},{"id":4,"name":"sksd;sd;ds"}]
/// message : "Data Fetched Successfully"
/// code : 200
/// type : "success"

class BrandsModel {
  BrandsModel({
      List<BaseDrandModel>? data,
      String? message, 
      num? code, 
      String? type,}){
    _data = data;
    _message = message;
    _code = code;
    _type = type;
}

  BrandsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BaseDrandModel.fromJson(v));
      });
    }
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }
  List<BaseDrandModel>? _data;
  String? _message;
  num? _code;
  String? _type;
BrandsModel copyWith({  List<BaseDrandModel>? data,
  String? message,
  num? code,
  String? type,
}) => BrandsModel(  data: data ?? _data,
  message: message ?? _message,
  code: code ?? _code,
  type: type ?? _type,
);
  List<BaseDrandModel>? get data => _data;
  String? get message => _message;
  num? get code => _code;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['code'] = _code;
    map['type'] = _type;
    return map;
  }

}

/// id : 1
/// name : "Naomie Price Jr."

class BaseDrandModel {
  BaseDrandModel({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  BaseDrandModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
BaseDrandModel copyWith({  num? id,
  String? name,
}) => BaseDrandModel(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}
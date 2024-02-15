import 'package:ksb/data/model/car_grage_model/car_grage_model.dart';
import 'package:ksb/views/pages/grage_car/grage_car.dart';

import '../grage_model/grage_model.dart';

/// data : {"id":3,"materials_prepared":false,"visit":{"id":"fa407b11-20e2-4ac6-b48a-40d99e30fa69","created_at":"2023-11-01 14:51","reason":"Why, I do wonder what CAN have happened to you? Tell us all about as curious as it went, as if she meant to take out of sight, they were lying round the rosetree; for, you see, because some of them."},"visitor_car":{"id":"4502a8e8-2b11-451c-9999-6804a6393f82","car_license":"61q585","car_model":"Monty Hoppe","color":{"id":50,"name":"Aquamarine"}},"status":"4","checking_amount":33,"malfunction_description":"I BEG your pardon!' she exclaimed in a mournful tone, 'he won't do a thing before, but she had caught the baby with some severity; 'it's very easy to take the roof off.' After a minute or two, they.","total_fix_amount":0,"paid_amount":441,"created_at":"2023-11-02 17:05","video":null,"images":[{"id":0,"url":"https://garage-updated-api.eductor.org/storage/default/store.png"},{"id":0,"url":"https://garage-updated-api.eductor.org/storage/default/store.png"},{"id":0,"url":"https://garage-updated-api.eductor.org/storage/default/store.png"}]}
/// message : "Data Fetched Successfully"
/// code : 200
/// type : "success"

class CarFixDetailsModel {
  CarFixDetailsModel({
      Data? data, 
      String? message, 
      num? code, 
      String? type,}){
    _data = data;
    _message = message;
    _code = code;
    _type = type;
}

  CarFixDetailsModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }
  Data? _data;
  String? _message;
  num? _code;
  String? _type;
CarFixDetailsModel copyWith({  Data? data,
  String? message,
  num? code,
  String? type,
}) => CarFixDetailsModel(  data: data ?? _data,
  message: message ?? _message,
  code: code ?? _code,
  type: type ?? _type,
);
  Data? get data => _data;
  String? get message => _message;
  num? get code => _code;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    map['code'] = _code;
    map['type'] = _type;
    return map;
  }

}

/// id : 3
/// materials_prepared : false
/// visit : {"id":"fa407b11-20e2-4ac6-b48a-40d99e30fa69","created_at":"2023-11-01 14:51","reason":"Why, I do wonder what CAN have happened to you? Tell us all about as curious as it went, as if she meant to take out of sight, they were lying round the rosetree; for, you see, because some of them."}
/// visitor_car : {"id":"4502a8e8-2b11-451c-9999-6804a6393f82","car_license":"61q585","car_model":"Monty Hoppe","color":{"id":50,"name":"Aquamarine"}}
/// status : "4"
/// checking_amount : 33
/// malfunction_description : "I BEG your pardon!' she exclaimed in a mournful tone, 'he won't do a thing before, but she had caught the baby with some severity; 'it's very easy to take the roof off.' After a minute or two, they."
/// total_fix_amount : 0
/// paid_amount : 441
/// created_at : "2023-11-02 17:05"
/// video : null
/// images : [{"id":0,"url":"https://garage-updated-api.eductor.org/storage/default/store.png"},{"id":0,"url":"https://garage-updated-api.eductor.org/storage/default/store.png"},{"id":0,"url":"https://garage-updated-api.eductor.org/storage/default/store.png"}]

class Data {
  Data({
      num? id,
    bool ? reviewed,
      bool? materialsPrepared, 
      Visit? visit, 
      VisitorCar? visitorCar, 
      String? status, 
      num? checkingAmount, 
      String? malfunctionDescription, 
      num? totalFixAmount, 
      num? paidAmount, 
      String? createdAt, 
      dynamic video, 
      List<Images>? images,}){
    _id = id;
    _materialsPrepared = materialsPrepared;
    _visit = visit;
    _visitorCar = visitorCar;
    _status = status;
    _checkingAmount = checkingAmount;
    _malfunctionDescription = malfunctionDescription;
    _totalFixAmount = totalFixAmount;
    _paidAmount = paidAmount;
    _createdAt = createdAt;
    _video = video;
    _images = images;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _materialsPrepared = json['materials_prepared'];
    _reviewed = json['reviewed'];
    _visit = json['visit'] != null ? Visit.fromJson(json['visit']) : null;
    _visitorCar = json['visitor_car'] != null ? VisitorCar.fromJson(json['visitor_car']) : null;
    _status = json['status'];
    _checkingAmount = json['checking_amount'];
    _malfunctionDescription = json['malfunction_description'];
    _totalFixAmount = json['total_fix_amount'];
    _paidAmount = json['paid_amount'];
    _createdAt = json['created_at'];
    _video = json['video'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
  }
  num? _id;
  bool ?_reviewed;
  bool? _materialsPrepared;
  Visit? _visit;
  VisitorCar? _visitorCar;
  String? _status;
  num? _checkingAmount;
  String? _malfunctionDescription;
  num? _totalFixAmount;
  num? _paidAmount;
  String? _createdAt;
  dynamic _video;
  List<Images>? _images;
Data copyWith({  num? id,
  bool? materialsPrepared,
  bool? reviewed,
  Visit? visit,
  VisitorCar? visitorCar,
  String? status,
  num? checkingAmount,
  String? malfunctionDescription,
  num? totalFixAmount,
  num? paidAmount,
  String? createdAt,
  dynamic video,
  List<Images>? images,
}) => Data(  id: id ?? _id,
  materialsPrepared: materialsPrepared ?? _materialsPrepared,
  visit: visit ?? _visit,
  visitorCar: visitorCar ?? _visitorCar,
  status: status ?? _status,
  checkingAmount: checkingAmount ?? _checkingAmount,
  malfunctionDescription: malfunctionDescription ?? _malfunctionDescription,
  totalFixAmount: totalFixAmount ?? _totalFixAmount,
  paidAmount: paidAmount ?? _paidAmount,
  createdAt: createdAt ?? _createdAt,
  video: video ?? _video,
  images: images ?? _images,
  reviewed: reviewed ?? _reviewed,
);
  num? get id => _id;
  bool? get materialsPrepared => _materialsPrepared;
  Visit? get visit => _visit;
  VisitorCar? get visitorCar => _visitorCar;
  String? get status => _status;
  num? get checkingAmount => _checkingAmount;
  String? get malfunctionDescription => _malfunctionDescription;
  num? get totalFixAmount => _totalFixAmount;
  num? get paidAmount => _paidAmount;
  String? get createdAt => _createdAt;
  dynamic get video => _video;
  List<Images>? get images => _images;
  bool? get reviewed => _reviewed;
  set status(String? value) {
    _status = value;
  }
  set reviewed(bool? value) {
    _reviewed = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['materials_prepared'] = _materialsPrepared;
    if (_visit != null) {
      map['visit'] = _visit?.toJson();
    }
    if (_visitorCar != null) {
      map['visitor_car'] = _visitorCar?.toJson();
    }
    map['status'] = _status;
    map['checking_amount'] = _checkingAmount;
    map['malfunction_description'] = _malfunctionDescription;
    map['total_fix_amount'] = _totalFixAmount;
    map['paid_amount'] = _paidAmount;
    map['created_at'] = _createdAt;
    map['video'] = _video;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 0
/// url : "https://garage-updated-api.eductor.org/storage/default/store.png"

class Images {
  Images({
      num? id, 
      String? url,}){
    _id = id;
    _url = url;
}

  Images.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
  }
  num? _id;
  String? _url;
Images copyWith({  num? id,
  String? url,
}) => Images(  id: id ?? _id,
  url: url ?? _url,
);
  num? get id => _id;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    return map;
  }

}

/// id : "4502a8e8-2b11-451c-9999-6804a6393f82"
/// car_license : "61q585"
/// car_model : "Monty Hoppe"
/// color : {"id":50,"name":"Aquamarine"}

class VisitorCar {
  VisitorCar({
      String? id, 
      String? carLicense, 
      String? carModel, 
      Color? color,}){
    _id = id;
    _carLicense = carLicense;
    _carModel = carModel;
    _color = color;
}

  VisitorCar.fromJson(dynamic json) {
    _id = json['id'];
    _carLicense = json['car_license'];
    _carModel = json['car_model'];
    _color = json['color'] != null ? Color.fromJson(json['color']) : null;
  }
  String? _id;
  String? _carLicense;
  String? _carModel;
  Color? _color;
VisitorCar copyWith({  String? id,
  String? carLicense,
  String? carModel,
  Color? color,
}) => VisitorCar(  id: id ?? _id,
  carLicense: carLicense ?? _carLicense,
  carModel: carModel ?? _carModel,
  color: color ?? _color,
);
  String? get id => _id;
  String? get carLicense => _carLicense;
  String? get carModel => _carModel;
  Color? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['car_license'] = _carLicense;
    map['car_model'] = _carModel;
    if (_color != null) {
      map['color'] = _color?.toJson();
    }
    return map;
  }

}

/// id : 50
/// name : "Aquamarine"

class Color {
  Color({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Color.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Color copyWith({  num? id,
  String? name,
  GarageModel ? garageModel,
}) => Color(  id: id ?? _id,
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

/// id : "fa407b11-20e2-4ac6-b48a-40d99e30fa69"
/// created_at : "2023-11-01 14:51"
/// reason : "Why, I do wonder what CAN have happened to you? Tell us all about as curious as it went, as if she meant to take out of sight, they were lying round the rosetree; for, you see, because some of them."

class Visit {
  Visit({
      String? id, 
      String? createdAt, 
      String? reason,
    GarageModel  ? garageModel,

  }){
    _id = id;
    _createdAt = createdAt;
    _reason = reason;
    _garageModel = garageModel;
}

  Visit.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _reason = json['reason'];
    _garageModel = json['garage'] != null ? GarageModel.fromJson(json['garage']) : null;
  }
  String? _id;
  String? _createdAt;
  String? _reason;
  GarageModel  ? _garageModel;

  Visit copyWith({  String? id,
  String? createdAt,
  String? reason,
    GarageModel  ? garageModel,

  }) => Visit(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  reason: reason ?? _reason,
    garageModel: garageModel ?? _garageModel,
);
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get reason => _reason;
  GarageModel  ? get garageModel => _garageModel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['reason'] = _reason;
    return map;
  }

}
import '../pageination_model/pageination_model.dart';
import '../visit_model/visit_model.dart';
import '../visitor_car_model/visitor_car_model.dart';

/// data : [{"id":102,"visit":{"id":"069bdecc-a5bd-4919-8c03-8aaf97db0a0a","created_at":"2023-10-28 19:17"},"visitor_car":{"id":"e789dfd3-ca68-43a7-aa92-2716d8bd2444","car_license":"BE7649","car_model":"Mr. Reinhold Cremin","color":{"id":31,"name":"SaddleBrown"}},"status":"1","created_at":"2023-10-29 09:50"},{"id":101,"visit":{"id":"069bdecc-a5bd-4919-8c03-8aaf97db0a0a","created_at":"2023-10-28 19:17"},"visitor_car":{"id":"e789dfd3-ca68-43a7-aa92-2716d8bd2444","car_license":"BE7649","car_model":"Mr. Reinhold Cremin","color":{"id":31,"name":"SaddleBrown"}},"status":"0","created_at":"2023-10-29 09:47"},{"id":52,"visit":{"id":"7ab37350-1add-4644-b469-1d1b0bef381d","created_at":"2023-10-28 19:17"},"visitor_car":{"id":"3ac9fe41-419f-4007-a7e4-b00690c5ba8e","car_license":"nrH215","car_model":"Mr. Alexie Davis II","color":{"id":28,"name":"MistyRose"}},"status":"6","created_at":"2023-10-29 09:54"},{"id":66,"visit":{"id":"fd1e3271-3215-4501-8898-3a26b59c9be0","created_at":"2023-10-28 19:17"},"visitor_car":{"id":"8fd7eab2-68df-49c8-b939-2c50f6abe350","car_license":"4Hz426","car_model":"Julianne Stamm V","color":{"id":22,"name":"DeepPink"}},"status":"3","created_at":"2023-10-29 09:54"},{"id":67,"visit":{"id":"ef4169a3-fa9e-4931-990f-cfe07a2423a3","created_at":"2023-10-28 19:17"},"visitor_car":{"id":"1972d1bd-d6ac-40cb-a219-7a8f3c76115b","car_license":"xvC320","car_model":"Holden Sporer","color":{"id":44,"name":"Azure"}},"status":"0","created_at":"2023-10-29 09:54"}]
/// links : {"first":"https://garage-updated-api.eductor.org/api/mobile/client/car_fixes?page=1","last":"https://garage-updated-api.eductor.org/api/mobile/client/car_fixes?page=21","next":"https://garage-updated-api.eductor.org/api/mobile/client/car_fixes?page=2","prev":null}
/// meta : {"current_page":1,"from":1,"last_page":21}
/// message : "Data Fetched Successfully"
/// code : 200
/// type : "success"

class GetCarFixesModel {
  GetCarFixesModel({
      List<BaseCarFixModel>? data,
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

  GetCarFixesModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BaseCarFixModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }
  List<BaseCarFixModel>? _data;
  Links? _links;
  Meta? _meta;
  String? _message;
  num? _code;
  String? _type;
GetCarFixesModel copyWith({  List<BaseCarFixModel>? data,
  Links? links,
  Meta? meta,
  String? message,
  num? code,
  String? type,
}) => GetCarFixesModel(  data: data ?? _data,
  links: links ?? _links,
  meta: meta ?? _meta,
  message: message ?? _message,
  code: code ?? _code,
  type: type ?? _type,
);
  List<BaseCarFixModel>? get data => _data;
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
/// last_page : 21

/// id : 102
/// visit : {"id":"069bdecc-a5bd-4919-8c03-8aaf97db0a0a","created_at":"2023-10-28 19:17"}
/// visitor_car : {"id":"e789dfd3-ca68-43a7-aa92-2716d8bd2444","car_license":"BE7649","car_model":"Mr. Reinhold Cremin","color":{"id":31,"name":"SaddleBrown"}}
/// status : "1"
/// created_at : "2023-10-29 09:50"

class BaseCarFixModel
{
  BaseCarFixModel({
      num? id, 
      VisitModel? visit,
      VisitorCarModel? visitorCar,
      String? status, 
      String? createdAt,}){
    _id = id;
    _visit = visit;
    _visitorCar = visitorCar;
    _status = status;
    _createdAt = createdAt;
}

  BaseCarFixModel.fromJson(dynamic json) {
    _id = json['id'];
    _visit = json['visit'] != null ? VisitModel.fromJson(json['visit']) : null;
    _visitorCar = json['visitor_car'] != null ? VisitorCarModel.fromJson(json['visitor_car']) : null;
    _status = json['status'];
    _createdAt = json['created_at'];
  }
  num? _id;
  VisitModel? _visit;
  VisitorCarModel? _visitorCar;
  String? _status;
  String? _createdAt;
BaseCarFixModel copyWith({  num? id,
  VisitModel? visit,
  VisitorCarModel? visitorCar,
  String? status,
  String? createdAt,
}) => BaseCarFixModel(  id: id ?? _id,
  visit: visit ?? _visit,
  visitorCar: visitorCar ?? _visitorCar,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  VisitModel? get visit => _visit;
  VisitorCarModel? get visitorCar => _visitorCar;
  String? get status => _status;
  String? get createdAt => _createdAt;
  set status(String? value) {
    _status = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_visit != null) {
      map['visit'] = _visit?.toJson();
    }
    if (_visitorCar != null) {
      map['visitor_car'] = _visitorCar?.toJson();
    }
    map['status'] = _status;
    map['created_at'] = _createdAt;
    return map;
  }

}

/// id : "e789dfd3-ca68-43a7-aa92-2716d8bd2444"
/// car_license : "BE7649"
/// car_model : "Mr. Reinhold Cremin"
/// color : {"id":31,"name":"SaddleBrown"}


/// id : 31
/// name : "SaddleBrown"


/// id : "069bdecc-a5bd-4919-8c03-8aaf97db0a0a"
/// created_at : "2023-10-28 19:17"


import '../../../notification_module/data/models/notification_model.dart';

/// data : [{"id":"01d0a037-6adc-41ea-8ebf-38487d57dc67","vin_number":"SVlsfdhFDnejjmhG31","car_license":"25J325","car_model":"Angelina Reynolds","brand":{"id":1,"name":"Hector Grant"},"color":{"id":19,"name":"SkyBlue","code":"#1cf523"},"model_year":"1977","visitor_id":6},{"id":"0216bd14-2f1b-4e46-aabe-ea3b3b3c3ef7","vin_number":"1N9mrRUh2cpUzYT929","car_license":"R66525","car_model":"Vladimir Dickens","brand":{"id":1,"name":"Hector Grant"},"color":{"id":14,"name":"Salmon","code":"#c1a135"},"model_year":"2023","visitor_id":6},{"id":"02c67c29-65e7-4d00-b67a-9db19ec76a26","vin_number":"l76vEEJvoF1hHf2t69","car_license":"4LZ590","car_model":"Kacey Dach","brand":{"id":1,"name":"Hector Grant"},"color":{"id":33,"name":"Orange","code":"#d63338"},"model_year":"1971","visitor_id":6},{"id":"0327e072-8eda-4b74-bc2b-cabdf9762637","vin_number":"mnFhlBDImQvkp4Es10","car_license":"ea8650","car_model":"Ms. Lera Pouros","brand":{"id":1,"name":"Hector Grant"},"color":{"id":2,"name":"Cyan","code":"#3a236d"},"model_year":"2007","visitor_id":6},{"id":"ffbfa4c5-6450-4d8d-9e98-b781356fc938","vin_number":"ybpuIbagbABHviB63","car_license":"ed5991","car_model":"Mr. Hugh Koepp III","brand":{"id":1,"name":"Hector Grant"},"color":{"id":35,"name":"GhostWhite","code":"#c772c5"},"model_year":"2020","visitor_id":6}]
/// links : {"first":"https://garage-updated-api.eductor.org/api/mobile/visitors_cars?page=1","last":"https://garage-updated-api.eductor.org/api/mobile/visitors_cars?page=20","next":"https://garage-updated-api.eductor.org/api/mobile/visitors_cars?page=2","prev":null}
/// meta : {"current_page":1,"from":1,"last_page":20}
/// message : "Data Fetched Successfully"
/// code : 200
/// type : "success"

class VisitorCarNewModel {
  VisitorCarNewModel({
      List<BaseVisitorCarModel>? data,
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

  VisitorCarNewModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BaseVisitorCarModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }
  List<BaseVisitorCarModel>? _data;
  Links? _links;
  Meta? _meta;
  String? _message;
  num? _code;
  String? _type;
VisitorCarNewModel copyWith({  List<BaseVisitorCarModel>? data,
  Links? links,
  Meta? meta,
  String? message,
  num? code,
  String? type,
}) => VisitorCarNewModel(  data: data ?? _data,
  links: links ?? _links,
  meta: meta ?? _meta,
  message: message ?? _message,
  code: code ?? _code,
  type: type ?? _type,
);
  List<BaseVisitorCarModel>? get data => _data;
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
/// last_page : 20


class BaseVisitorCarModel {
  BaseVisitorCarModel({
      String? id, 
      String? vinNumber, 
      String? carLicense, 
      String? carModel, 
      Brand? brand, 
      Color? color, 
      String? modelYear, 
      num? visitorId,}){
    _id = id;
    _vinNumber = vinNumber;
    _carLicense = carLicense;
    _carModel = carModel;
    _brand = brand;
    _color = color;
    _modelYear = modelYear;
    _visitorId = visitorId;
}

  BaseVisitorCarModel.fromJson(dynamic json) {
    _id = json['id'];
    _vinNumber = json['vin_number'];
    _carLicense = json['car_license'];
    _carModel = json['car_model'];
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    _color = json['color'] != null ? Color.fromJson(json['color']) : null;
    _modelYear = json['model_year'];
    _visitorId = json['visitor_id'];
  }
  String? _id;
  String? _vinNumber;
  String? _carLicense;
  String? _carModel;
  Brand? _brand;
  Color? _color;
  String? _modelYear;
  num? _visitorId;
BaseVisitorCarModel copyWith({  String? id,
  String? vinNumber,
  String? carLicense,
  String? carModel,
  Brand? brand,
  Color? color,
  String? modelYear,
  num? visitorId,
}) => BaseVisitorCarModel(  id: id ?? _id,
  vinNumber: vinNumber ?? _vinNumber,
  carLicense: carLicense ?? _carLicense,
  carModel: carModel ?? _carModel,
  brand: brand ?? _brand,
  color: color ?? _color,
  modelYear: modelYear ?? _modelYear,
  visitorId: visitorId ?? _visitorId,
);
  String? get id => _id;
  String? get vinNumber => _vinNumber;
  String? get carLicense => _carLicense;
  String? get carModel => _carModel;
  Brand? get brand => _brand;
  Color? get color => _color;
  String? get modelYear => _modelYear;
  num? get visitorId => _visitorId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['vin_number'] = _vinNumber;
    map['car_license'] = _carLicense;
    map['car_model'] = _carModel;
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    if (_color != null) {
      map['color'] = _color?.toJson();
    }
    map['model_year'] = _modelYear;
    map['visitor_id'] = _visitorId;
    return map;
  }

}

/// id : 19
/// name : "SkyBlue"
/// code : "#1cf523"

class Color {
  Color({
      num? id, 
      String? name, 
      String? code,}){
    _id = id;
    _name = name;
    _code = code;
}

  Color.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
  }
  num? _id;
  String? _name;
  String? _code;
Color copyWith({  num? id,
  String? name,
  String? code,
}) => Color(  id: id ?? _id,
  name: name ?? _name,
  code: code ?? _code,
);
  num? get id => _id;
  String? get name => _name;
  String? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    return map;
  }

}

/// id : 1
/// name : "Hector Grant"

class Brand {
  Brand({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Brand.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Brand copyWith({  num? id,
  String? name,
}) => Brand(  id: id ?? _id,
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
/// data : {"id":1,"name":"Hector Donnelly","favorite":true,"car_models":[{"car_model_id":1,"name":"Prof. Reed Flatley","model_year":null},{"car_model_id":2,"name":"Trevion Wuckert","model_year":null},{"car_model_id":3,"name":"Prof. Golda Streich MD","model_year":null},{"car_model_id":4,"name":"Dylan Walsh","model_year":null}],"description":"Suppress him! Pinch him! Off with his head!' or 'Off with her head! Off--' 'Nonsense!' said Alice, in a furious passion, and went on without attending to her, one on each side, and opened their eyes.","quantity":147,"selling_price":899.31,"images":[{"id":0,"url":"https://ksb-api.eductor.org/storage/default/product.webp"},{"id":0,"url":"https://ksb-api.eductor.org/storage/default/product.webp"}]}
/// message : "Data Fetched Successfully"
/// code : 200
/// type : "success"

class GetProductDetilesModel {
  GetProductDetilesModel({
      BaseDetailsCar? data,
      String? message, 
      num? code, 
      String? type,}){
    _data = data;
    _message = message;
    _code = code;
    _type = type;
}

  GetProductDetilesModel.fromJson(dynamic json) {
    _data = json['data'] != null ? BaseDetailsCar.fromJson(json['data']) : null;
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }
  BaseDetailsCar? _data;
  String? _message;
  num? _code;
  String? _type;
GetProductDetilesModel copyWith({  BaseDetailsCar? data,
  String? message,
  num? code,
  String? type,
}) => GetProductDetilesModel(  data: data ?? _data,
  message: message ?? _message,
  code: code ?? _code,
  type: type ?? _type,
);
  BaseDetailsCar? get data => _data;
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

/// id : 1
/// name : "Hector Donnelly"
/// favorite : true
/// car_models : [{"car_model_id":1,"name":"Prof. Reed Flatley","model_year":null},{"car_model_id":2,"name":"Trevion Wuckert","model_year":null},{"car_model_id":3,"name":"Prof. Golda Streich MD","model_year":null},{"car_model_id":4,"name":"Dylan Walsh","model_year":null}]
/// description : "Suppress him! Pinch him! Off with his head!' or 'Off with her head! Off--' 'Nonsense!' said Alice, in a furious passion, and went on without attending to her, one on each side, and opened their eyes."
/// quantity : 147
/// selling_price : 899.31
/// images : [{"id":0,"url":"https://ksb-api.eductor.org/storage/default/product.webp"},{"id":0,"url":"https://ksb-api.eductor.org/storage/default/product.webp"}]

class BaseDetailsCar {
  BaseDetailsCar({
      num? id, 
      String? name, 
      bool? favorite, 
      List<CarModels>? carModels, 
      String? description, 
      num? quantity, 
      num? sellingPrice, 
      List<Images>? images,}){
    _id = id;
    _name = name;
    _favorite = favorite;
    _carModels = carModels;
    _description = description;
    _quantity = quantity;
    _sellingPrice = sellingPrice;
    _images = images;
}

  BaseDetailsCar.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _favorite = json['favorite'];
    if (json['car_models'] != null) {
      _carModels = [];
      json['car_models'].forEach((v) {
        _carModels?.add(CarModels.fromJson(v));
      });
    }
    _description = json['description'];
    _quantity = json['quantity'];
    _sellingPrice = json['selling_price'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  bool? _favorite;
  List<CarModels>? _carModels;
  String? _description;
  num? _quantity;
  num? _sellingPrice;
  List<Images>? _images;
BaseDetailsCar copyWith({  num? id,
  String? name,
  bool? favorite,
  List<CarModels>? carModels,
  String? description,
  num? quantity,
  num? sellingPrice,
  List<Images>? images,
}) => BaseDetailsCar(  id: id ?? _id,
  name: name ?? _name,
  favorite: favorite ?? _favorite,
  carModels: carModels ?? _carModels,
  description: description ?? _description,
  quantity: quantity ?? _quantity,
  sellingPrice: sellingPrice ?? _sellingPrice,
  images: images ?? _images,
);
  num? get id => _id;
  String? get name => _name;
  bool? get favorite => _favorite;
  List<CarModels>? get carModels => _carModels;
  String? get description => _description;
  num? get quantity => _quantity;
  num? get sellingPrice => _sellingPrice;
  List<Images>? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['favorite'] = _favorite;
    if (_carModels != null) {
      map['car_models'] = _carModels?.map((v) => v.toJson()).toList();
    }
    map['description'] = _description;
    map['quantity'] = _quantity;
    map['selling_price'] = _sellingPrice;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 0
/// url : "https://ksb-api.eductor.org/storage/default/product.webp"

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

/// car_model_id : 1
/// name : "Prof. Reed Flatley"
/// model_year : null

class CarModels {
  CarModels({
      num? carModelId, 
      String? name, 
      dynamic modelYear,}){
    _carModelId = carModelId;
    _name = name;
    _modelYear = modelYear;
}

  CarModels.fromJson(dynamic json) {
    _carModelId = json['car_model_id'];
    _name = json['name'];
    _modelYear = json['model_year'];
  }
  num? _carModelId;
  String? _name;
  dynamic _modelYear;
CarModels copyWith({  num? carModelId,
  String? name,
  dynamic modelYear,
}) => CarModels(  carModelId: carModelId ?? _carModelId,
  name: name ?? _name,
  modelYear: modelYear ?? _modelYear,
);
  num? get carModelId => _carModelId;
  String? get name => _name;
  dynamic get modelYear => _modelYear;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['car_model_id'] = _carModelId;
    map['name'] = _name;
    map['model_year'] = _modelYear;
    return map;
  }

}
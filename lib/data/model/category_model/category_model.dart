
class CategoryModel
{
  CategoryModel({
      List<BaseCategoryModel>? data,
      String? message, 
      String? type, 
      num? code,
      bool? showToast,}){
    _data = data;
    _message = message;
    _type = type;
    _code = code;
    _showToast = showToast;
}

  CategoryModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BaseCategoryModel.fromJson(v));
      });
    }
    _message = json['message'];
    _type = json['type'];
    _code = json['code'];
    _showToast = json['showToast'];
  }
  List<BaseCategoryModel>? _data;
  String? _message;
  String? _type;
  num? _code;
  bool? _showToast;
CategoryModel copyWith({  List<BaseCategoryModel>? data,
  String? message,
  String? type,
  num? code,
  bool? showToast,
}) => CategoryModel(  data: data ?? _data,
  message: message ?? _message,
  type: type ?? _type,
  code: code ?? _code,
  showToast: showToast ?? _showToast,
);
  List<BaseCategoryModel>? get data => _data;
  String? get message => _message;
  String? get type => _type;
  num? get code => _code;
  bool? get showToast => _showToast;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['type'] = _type;
    map['code'] = _code;
    map['showToast'] = _showToast;
    return map;
  }

}

/// id : 63
/// name : "Mrs. Dorothea Toy"
/// image : "https://rayed-api.ksbgarage.com/storage/default/store.png"

class BaseCategoryModel {
  BaseCategoryModel({
      String? id,
      String? name, 
      String? image,}){
    _id = id;
    _name = name;
    _image = image;
}

  BaseCategoryModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }
  String? _id;
  String? _name;
  String? _image;
BaseCategoryModel copyWith({  String? id,
  String? name,
  String? image,
}) => BaseCategoryModel(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
);
  String? get id => _id;
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}
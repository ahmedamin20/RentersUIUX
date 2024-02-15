import '../images_model/images_model.dart';

class BaseProductDetilesModel {
  BaseProductDetilesModel({
    num? id,
    String? name,
    bool? favorite,
    String? description,
    num? quantity,
    num? sellingPrice,
    List<ImagesModel>? images,}){
    _id = id;
    _name = name;
    _favorite = favorite;
    _description = description;
    _quantity = quantity;
    _sellingPrice = sellingPrice;
    _images = images;
  }

  BaseProductDetilesModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _favorite = json['favorite'];
    _description = json['description'];
    _quantity = json['quantity'];
    _sellingPrice = json['selling_price'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(ImagesModel.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  bool? _favorite;
  String? _description;
  num? _quantity;
  num? _sellingPrice;
  List<ImagesModel>? _images;
  BaseProductDetilesModel copyWith({  num? id,
    String? name,
    bool? favorite,
    String? description,
    num? quantity,
    num? sellingPrice,
    List<ImagesModel>? images,
  }) => BaseProductDetilesModel(  id: id ?? _id,
    name: name ?? _name,
    favorite: favorite ?? _favorite,
    description: description ?? _description,
    quantity: quantity ?? _quantity,
    sellingPrice: sellingPrice ?? _sellingPrice,
    images: images ?? _images,
  );
  num? get id => _id;
  String? get name => _name;
  bool? get favorite => _favorite;
  String? get description => _description;
  num? get quantity => _quantity;
  num? get sellingPrice => _sellingPrice;
  List<ImagesModel>? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['favorite'] = _favorite;
    map['description'] = _description;
    map['quantity'] = _quantity;
    map['selling_price'] = _sellingPrice;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

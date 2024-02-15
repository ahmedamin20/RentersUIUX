import '../images_model/images_model.dart';

class BaseProductData {
  BaseProductData({
    num? id,
    String? name,
    num? quantity,
    num? sellingPrice,
    bool ? favorite,
    List<ImagesModel>? images,}){
    _id = id;
    _name = name;
    _quantity = quantity;
    _sellingPrice = sellingPrice;
    _images = images;

  }

  BaseProductData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _quantity = json['quantity'];
    _sellingPrice = json['selling_price'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(ImagesModel.fromJson(v));
      });
    }
    _favorite = json['favorite'];
  }
  num? _id;
  String? _name;
  num? _quantity;
  num? _sellingPrice;
  List<ImagesModel>? _images;
  bool ?_favorite;
  BaseProductData copyWith({  num? id,
    String? name,
    num? quantity,
    num? sellingPrice,
    List<ImagesModel>? images,
    bool ? favorite,
  }) => BaseProductData(  id: id ?? _id,
    name: name ?? _name,
    quantity: quantity ?? _quantity,
    sellingPrice: sellingPrice ?? _sellingPrice,
    images: images ?? _images,
      favorite : favorite ?? false,
  );
  num? get id => _id;
  String? get name => _name;
  num? get quantity => _quantity;
  num? get sellingPrice => _sellingPrice;
  List<ImagesModel>? get images => _images;
  bool? get favorite => _favorite;
  set isFavorite(bool value) {
    _favorite = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['quantity'] = _quantity;
    map['selling_price'] = _sellingPrice;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

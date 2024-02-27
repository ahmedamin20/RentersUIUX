class ProductDetailsModel {
  ProductDetailsModel({
      this.data, 
      this.message, 
      this.type, 
      this.code, 
      this.showToast,});

  ProductDetailsModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    type = json['type'];
    code = json['code'];
    showToast = json['showToast'];
  }
  Data? data;
  String? message;
  String? type;
  num? code;
  bool? showToast;
ProductDetailsModel copyWith({  Data? data,
  String? message,
  String? type,
  num? code,
  bool? showToast,
}) => ProductDetailsModel(  data: data ?? this.data,
  message: message ?? this.message,
  type: type ?? this.type,
  code: code ?? this.code,
  showToast: showToast ?? this.showToast,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    map['type'] = type;
    map['code'] = code;
    map['showToast'] = showToast;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name, 
      this.minimumDays, 
      this.maximumDays, 
      this.ratingAverage, 
      this.health, 
      this.categoryId, 
      this.description, 
      this.category, 
      this.price, 
      this.mainImage, 
      this.otherImages,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    minimumDays = json['minimum_days'];
    maximumDays = json['maximum_days'];
    ratingAverage = json['rating_average'];
    health = json['health'];
    categoryId = json['category_id'];
    description = json['description'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    price = json['price'];
    mainImage = json['main_image'];
    if (json['other_images'] != null) {
      otherImages = [];
      json['other_images'].forEach((v) {
        otherImages?.add(OtherImages.fromJson(v));
      });
    }
  }
  num? id;
  String? name;
  num? minimumDays;
  num? maximumDays;
  num? ratingAverage;
  num? health;
  num? categoryId;
  String? description;
  Category? category;
  num? price;
  String? mainImage;
  List<OtherImages>? otherImages;
Data copyWith({  num? id,
  String? name,
  num? minimumDays,
  num? maximumDays,
  num? ratingAverage,
  num? health,
  num? categoryId,
  String? description,
  Category? category,
  num? price,
  String? mainImage,
  List<OtherImages>? otherImages,
}) => Data(  id: id ?? this.id,
  name: name ?? this.name,
  minimumDays: minimumDays ?? this.minimumDays,
  maximumDays: maximumDays ?? this.maximumDays,
  ratingAverage: ratingAverage ?? this.ratingAverage,
  health: health ?? this.health,
  categoryId: categoryId ?? this.categoryId,
  description: description ?? this.description,
  category: category ?? this.category,
  price: price ?? this.price,
  mainImage: mainImage ?? this.mainImage,
  otherImages: otherImages ?? this.otherImages,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['minimum_days'] = minimumDays;
    map['maximum_days'] = maximumDays;
    map['rating_average'] = ratingAverage;
    map['health'] = health;
    map['category_id'] = categoryId;
    map['description'] = description;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['price'] = price;
    map['main_image'] = mainImage;
    if (otherImages != null) {
      map['other_images'] = otherImages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class OtherImages {
  OtherImages({
      this.id, 
      this.url,});

  OtherImages.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
  }
  num? id;
  String? url;
OtherImages copyWith({  num? id,
  String? url,
}) => OtherImages(  id: id ?? this.id,
  url: url ?? this.url,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    return map;
  }

}

class Category {
  Category({
      this.id, 
      this.name,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;
Category copyWith({  num? id,
  String? name,
}) => Category(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}
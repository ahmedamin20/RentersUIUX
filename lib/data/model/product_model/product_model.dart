import 'package:ksb/data/model/show_one_product_model/show_one_product_model.dart';

class ProductModel {
  ProductModel({
      this.data, 
      this.links, 
      this.meta, 
      this.message, 
      this.code, 
      this.type,});

  ProductModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BaseProductModel.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    code = json['code'];
    type = json['type'];
  }
  List<BaseProductModel>? data;
  Links? links;
  Meta? meta;
  String? message;
  num? code;
  String? type;
ProductModel copyWith({  List<BaseProductModel>? data,
  Links? links,
  Meta? meta,
  String? message,
  num? code,
  String? type,
}) => ProductModel(  data: data ?? this.data,
  links: links ?? this.links,
  meta: meta ?? this.meta,
  message: message ?? this.message,
  code: code ?? this.code,
  type: type ?? this.type,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      map['links'] = links?.toJson();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    map['message'] = message;
    map['code'] = code;
    map['type'] = type;
    return map;
  }

}

class Meta {
  Meta({
      this.currentPage, 
      this.from, 
      this.lastPage,});

  Meta.fromJson(dynamic json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
  }
  num? currentPage;
  num? from;
  num? lastPage;
Meta copyWith({  num? currentPage,
  num? from,
  num? lastPage,
}) => Meta(  currentPage: currentPage ?? this.currentPage,
  from: from ?? this.from,
  lastPage: lastPage ?? this.lastPage,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    map['from'] = from;
    map['last_page'] = lastPage;
    return map;
  }

}

class Links {
  Links({
      this.first, 
      this.last, 
      this.next, 
      this.prev,});

  Links.fromJson(dynamic json) {
    first = json['first'];
    last = json['last'];
    next = json['next'];
    prev = json['prev'];
  }
  String? first;
  String? last;
  String? next;
  dynamic prev;
Links copyWith({  String? first,
  String? last,
  String? next,
  dynamic prev,
}) => Links(  first: first ?? this.first,
  last: last ?? this.last,
  next: next ?? this.next,
  prev: prev ?? this.prev,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = first;
    map['last'] = last;
    map['next'] = next;
    map['prev'] = prev;
    return map;
  }

}

class BaseProductModel {
  BaseProductModel({
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
      this.user,
    this.otherImages
  });

  BaseProductModel.fromJson(dynamic json) {
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    otherImages = json['other_images'] != null ? (json['other_images'] as List).map((e) => OtherImages.fromJson(e)).toList() : null;
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
  User? user;
  List<OtherImages> ? otherImages ;

BaseProductModel copyWith({  num? id,
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
  User? user,
  List<OtherImages> ? otherImages,
}) => BaseProductModel(  id: id ?? this.id,
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
  user: user ?? this.user,

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
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}
class OtherImages
{
  String ?id;
  String ?image;
  OtherImages({this.id, this.image});
  OtherImages.fromJson(dynamic json)
  {
    id = json['id'];
    image = json['url'];
  }
}
class User {
  User({
      this.id, 
      this.name,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;
User copyWith({  num? id,
  String? name,
}) => User(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
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
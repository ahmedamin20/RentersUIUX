class ProductModel {
  List<BaseProductModel>? data;
  Links? links;
  Meta? meta;
  String? message;
  int? code;
  String? type;

  ProductModel(
      {this.data, this.links, this.meta, this.message, this.code, this.type});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BaseProductModel>[];
      json['data'].forEach((v) {
        data!.add(new BaseProductModel.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    code = json['code'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    data['type'] = this.type;
    return data;
  }
}

class BaseProductModel {
  int? id;
  String? name;
  int? minimumDays;
  int? maximumDays;
  int? ratingAverage;
  int? health;
  int? categoryId;
  String? description;
  Category? category;
  int? price;
  String? mainImage;
  Category? user;

  BaseProductModel(
      {this.id,
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
      this.user});

  BaseProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    minimumDays = json['minimum_days'];
    maximumDays = json['maximum_days'];
    ratingAverage = json['rating_average'];
    health = json['health'];
    categoryId = json['category_id'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    price = json['price'];
    mainImage = json['main_image'];
    user = json['user'] != null ? new Category.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['minimum_days'] = this.minimumDays;
    data['maximum_days'] = this.maximumDays;
    data['rating_average'] = this.ratingAverage;
    data['health'] = this.health;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['price'] = this.price;
    data['main_image'] = this.mainImage;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? next;
  String? prev;

  Links({this.first, this.last, this.next, this.prev});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['next'] = this.next;
    data['prev'] = this.prev;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;

  Meta({this.currentPage, this.from, this.lastPage});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    return data;
  }
}

class ShowOrderModel {
  List<BaseShowOrderModel>? data;
  Links? links;
  Meta? meta;
  String? message;
  int? code;
  String? type;

  ShowOrderModel(
      {this.data, this.links, this.meta, this.message, this.code, this.type});

  ShowOrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BaseShowOrderModel>[];
      json['data'].forEach((v) {
        data!.add(new BaseShowOrderModel.fromJson(v));
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

class BaseShowOrderModel {
  int? id;
  int? price;
  int? status;
  String? fromDate;
  String? toDate;
  String? createdAt;
  ProductOrder? product;
  ToUser? fromUser;
  ToUser? toUser;

  BaseShowOrderModel(
      {this.id,
      this.price,
      this.status,
      this.fromDate,
      this.toDate,
      this.createdAt,
      this.product,
      this.fromUser,
      this.toUser});

  BaseShowOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    status = json['status'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    createdAt = json['created_at'];
    product = json['product'] != null
        ? new ProductOrder.fromJson(json['product'])
        : null;
    fromUser = json['from_user'];
    toUser =
        json['to_user'] != null ? new ToUser.fromJson(json['to_user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['status'] = this.status;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['created_at'] = this.createdAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['from_user'] = this.fromUser;
    if (this.toUser != null) {
      data['to_user'] = this.toUser!.toJson();
    }
    return data;
  }
}

class ProductOrder {
  int? id;
  String? name;
  int? ratingAverage;
  int? health;
  int? categoryId;
  String? description;
  Category? category;
  String? mainImage;

  ProductOrder(
      {this.id,
      this.name,
      this.ratingAverage,
      this.health,
      this.categoryId,
      this.description,
      this.category,
      this.mainImage});

  ProductOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ratingAverage = json['rating_average'];
    health = json['health'];
    categoryId = json['category_id'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    mainImage = json['main_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rating_average'] = this.ratingAverage;
    data['health'] = this.health;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['main_image'] = this.mainImage;
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

class ToUser {
  int? id;
  String? name;
  bool? status;
  bool? identityVerified;
  String? email;
  String? type;
  Null? frontNationalId;
  Null? backNationalId;

  ToUser(
      {this.id,
      this.name,
      this.status,
      this.identityVerified,
      this.email,
      this.type,
      this.frontNationalId,
      this.backNationalId});

  ToUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    identityVerified = json['identity_verified'];
    email = json['email'];
    type = json['type'];
    frontNationalId = json['front_national_id'];
    backNationalId = json['back_national_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['identity_verified'] = this.identityVerified;
    data['email'] = this.email;
    data['type'] = this.type;
    data['front_national_id'] = this.frontNationalId;
    data['back_national_id'] = this.backNationalId;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  Null? next;
  Null? prev;

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

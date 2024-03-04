class ShowAllBranchProducts {
  List<ShowAllBranchProductData>? showAllBranchProductData;
  Links? links;
  Meta? meta;
  String? message;
  int? code;
  String? type;

  ShowAllBranchProducts(
      {this.showAllBranchProductData, this.links, this.meta, this.message, this.code, this.type});

  ShowAllBranchProducts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      showAllBranchProductData = <ShowAllBranchProductData>[];
      json['data'].forEach((v) {
        showAllBranchProductData!.add(new ShowAllBranchProductData.fromJson(v));
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
    if (this.showAllBranchProductData != null) {
      data['data'] = this.showAllBranchProductData!.map((v) => v.toJson()).toList();
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

class ShowAllBranchProductData {
  String? id;
  int? quantity;
  bool? status;
  int? ratingAverage;
  Product? product;

  ShowAllBranchProductData({this.id, this.quantity, this.status, this.ratingAverage, this.product});

  ShowAllBranchProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    status = json['status'];
    ratingAverage = json['rating_average'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['rating_average'] = this.ratingAverage;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? description;
  String? price;
  List<Sizes>? sizes;
  String? mainImage;
  String? categoryId;
  int? menuSectionId;

  Product(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.sizes,
        this.mainImage,
        this.categoryId,
        this.menuSectionId});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(new Sizes.fromJson(v));
      });
    }
    mainImage = json['main_image'];
    categoryId = json['category_id'];
    menuSectionId = json['menu_section_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    data['main_image'] = this.mainImage;
    data['category_id'] = this.categoryId;
    data['menu_section_id'] = this.menuSectionId;
    return data;
  }
}

class Sizes {
  String? name;
  double? price;

  Sizes({this.name, this.price});

  Sizes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = double.parse(json['price'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? next;
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
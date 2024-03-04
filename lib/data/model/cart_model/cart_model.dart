class CartModel {
  List<Data>? data;
  Links? links;
  Meta? meta;
  String? message;
  int? code;
  String? type;

  CartModel(
      {this.data, this.links, this.meta, this.message, this.code, this.type});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? id;
  dynamic quantity;
  dynamic price;
  Size? size;
  BranchProduct? branchProduct;
  List<GroupedAddons>? groupedAddons;

  Data(
      {this.id,
        this.quantity,
        this.price,
        this.size,
        this.branchProduct,
        this.groupedAddons});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price']??'0';
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
    branchProduct = json['branchProduct'] != null
        ? new BranchProduct.fromJson(json['branchProduct'])
        : null;
    if (json['grouped_addons'] != null) {
      groupedAddons = <GroupedAddons>[];
      json['grouped_addons'].forEach((v) {
        groupedAddons!.add(new GroupedAddons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    if (this.size != null) {
      data['size'] = this.size!.toJson();
    }
    if (this.branchProduct != null) {
      data['branchProduct'] = this.branchProduct!.toJson();
    }
    if (this.groupedAddons != null) {
      data['grouped_addons'] =
          this.groupedAddons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Size {
  dynamic name;
  dynamic price;

  Size({this.name, this.price});

  Size.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

class BranchProduct {
  String? id;
  Branch? branch;
  Product? product;

  BranchProduct({this.id, this.branch, this.product});

  BranchProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branch =
    json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Branch {
  dynamic id;
  dynamic name;
  num? ratingAverage;

  Branch({this.id, this.name, this.ratingAverage});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ratingAverage = json['rating_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rating_average'] = this.ratingAverage;
    return data;
  }
}

class Product {
  dynamic id;
  dynamic name;
  dynamic mainImage;

  Product({this.id, this.name, this.mainImage});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mainImage = json['main_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['main_image'] = this.mainImage;
    return data;
  }
}

class GroupedAddons {
  dynamic id;
  dynamic name;
  bool? isRequired;
  bool? isMultiSelect;
  List<Items>? items;

  GroupedAddons(
      {this.id, this.name, this.isRequired, this.isMultiSelect, this.items});

  GroupedAddons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isRequired = json['is_required'];
    isMultiSelect = json['is_multi_select'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_required'] = this.isRequired;
    data['is_multi_select'] = this.isMultiSelect;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  dynamic id;
  dynamic name;
  dynamic price;

  Items({this.id, this.name, this.price});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

class Links {
  dynamic first;
  dynamic last;
  dynamic next;
  dynamic prev;

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
  dynamic currentPage;
  dynamic from;
  dynamic lastPage;

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
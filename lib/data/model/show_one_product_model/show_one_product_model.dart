class ShowOneProductModel {
  ShowOneProductData? showOneProductData;
  String? message;
  String? type;
  int? code;
  bool? showToast;

  ShowOneProductModel(
      {this.showOneProductData, this.message, this.type, this.code, this.showToast});

  ShowOneProductModel.fromJson(Map<String, dynamic> json) {
    showOneProductData = json['data'] != null ? new ShowOneProductData.fromJson(json['data']) : null;
    message = json['message'];
    type = json['type'];
    code = json['code'];
    showToast = json['showToast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.showOneProductData != null) {
      data['data'] = this.showOneProductData!.toJson();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    data['code'] = this.code;
    data['showToast'] = this.showToast;
    return data;
  }
}

class ShowOneProductData {
  String? id;
  int? quantity;
  bool? status;
  int? ratingAverage;
  Product? product;

  ShowOneProductData({this.id, this.quantity, this.status, this.ratingAverage, this.product});

  ShowOneProductData.fromJson(Map<String, dynamic> json) {
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
  dynamic? price;
  List<Sizes>? sizes;
  String? mainImage;
  String? categoryId;
  int? menuSectionId;
  List<GroupedAddons>? groupedAddons;
  List<OtherImages>? otherImages;

  Product(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.sizes,
        this.mainImage,
        this.categoryId,
        this.menuSectionId,
        this.groupedAddons,
        this.otherImages});

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
    if (json['grouped_addons'] != null) {
      groupedAddons = <GroupedAddons>[];
      json['grouped_addons'].forEach((v) {
        groupedAddons!.add(new GroupedAddons.fromJson(v));
      });
    }
    if (json['other_images'] != null) {
      otherImages = <OtherImages>[];
      json['other_images'].forEach((v) {
        otherImages!.add(new OtherImages.fromJson(v));
      });
    }
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
    if (this.groupedAddons != null) {
      data['grouped_addons'] =
          this.groupedAddons!.map((v) => v.toJson()).toList();
    }
    if (this.otherImages != null) {
      data['other_images'] = this.otherImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sizes {
  String? name;
  dynamic? price;

  Sizes({this.name, this.price});

  Sizes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price =json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

class GroupedAddons {
  int? id;
  String? name;
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
  int? id;
  String? name;
  dynamic? price;

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

class OtherImages {
  int? id;
  String? url;

  OtherImages({this.id, this.url});

  OtherImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}
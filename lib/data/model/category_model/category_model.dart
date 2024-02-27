class CategoryModel {
  CategoryModel({
      this.data, 
      this.links, 
      this.meta, 
      this.message, 
      this.code, 
      this.type,});

  CategoryModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    code = json['code'];
    type = json['type'];
  }
  List<Data>? data;
  Links? links;
  Meta? meta;
  String? message;
  num? code;
  String? type;
CategoryModel copyWith({  List<Data>? data,
  Links? links,
  Meta? meta,
  String? message,
  num? code,
  String? type,
}) => CategoryModel(  data: data ?? this.data,
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

class Data {
  Data({
      this.id, 
      this.name, 
      this.image,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? image;
Data copyWith({  num? id,
  String? name,
  String? image,
}) => Data(  id: id ?? this.id,
  name: name ?? this.name,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}
/// data : [{"id":1,"name":"Beau Stark","image":"https://api.ksbgarage.com/storage/default/store.png"}]
/// links : {"first":"https://api.ksbgarage.com/public/brands?page=1","last":"https://api.ksbgarage.com/public/brands?page=1","next":null,"prev":null}
/// meta : {"current_page":1,"from":1,"last_page":1}
/// message : "Data Fetched Successfully"
/// code : 200
/// type : "success"

class BrandModel
{
  BrandModel({
      List<BaseBrandModel>? data,
      Links? links, 
      Meta? meta, 
      String? message, 
      num? code, 
      String? type,}){
    _data = data;
    _links = links;
    _meta = meta;
    _message = message;
    _code = code;
    _type = type;
}

  BrandModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BaseBrandModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }
  List<BaseBrandModel>? _data;
  Links? _links;
  Meta? _meta;
  String? _message;
  num? _code;
  String? _type;
BrandModel copyWith({  List<BaseBrandModel>? data,
  Links? links,
  Meta? meta,
  String? message,
  num? code,
  String? type,
}) => BrandModel(  data: data ?? _data,
  links: links ?? _links,
  meta: meta ?? _meta,
  message: message ?? _message,
  code: code ?? _code,
  type: type ?? _type,
);
  List<BaseBrandModel>? get data => _data;
  Links? get links => _links;
  Meta? get meta => _meta;
  String? get message => _message;
  num? get code => _code;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_links != null) {
      map['links'] = _links?.toJson();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    map['message'] = _message;
    map['code'] = _code;
    map['type'] = _type;
    return map;
  }

}

/// current_page : 1
/// from : 1
/// last_page : 1

class Meta {
  Meta({
      num? currentPage, 
      num? from, 
      num? lastPage,}){
    _currentPage = currentPage;
    _from = from;
    _lastPage = lastPage;
}

  Meta.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    _from = json['from'];
    _lastPage = json['last_page'];
  }
  num? _currentPage;
  num? _from;
  num? _lastPage;
Meta copyWith({  num? currentPage,
  num? from,
  num? lastPage,
}) => Meta(  currentPage: currentPage ?? _currentPage,
  from: from ?? _from,
  lastPage: lastPage ?? _lastPage,
);
  num? get currentPage => _currentPage;
  num? get from => _from;
  num? get lastPage => _lastPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    return map;
  }

}

/// first : "https://api.ksbgarage.com/public/brands?page=1"
/// last : "https://api.ksbgarage.com/public/brands?page=1"
/// next : null
/// prev : null

class Links {
  Links({
      String? first, 
      String? last, 
      dynamic next, 
      dynamic prev,}){
    _first = first;
    _last = last;
    _next = next;
    _prev = prev;
}

  Links.fromJson(dynamic json) {
    _first = json['first'];
    _last = json['last'];
    _next = json['next'];
    _prev = json['prev'];
  }
  String? _first;
  String? _last;
  dynamic _next;
  dynamic _prev;
Links copyWith({  String? first,
  String? last,
  dynamic next,
  dynamic prev,
}) => Links(  first: first ?? _first,
  last: last ?? _last,
  next: next ?? _next,
  prev: prev ?? _prev,
);
  String? get first => _first;
  String? get last => _last;
  dynamic get next => _next;
  dynamic get prev => _prev;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = _first;
    map['last'] = _last;
    map['next'] = _next;
    map['prev'] = _prev;
    return map;
  }

}

/// id : 1
/// name : "Beau Stark"
/// image : "https://api.ksbgarage.com/storage/default/store.png"

class BaseBrandModel {
  BaseBrandModel({
      num? id, 
      String? name, 
      String? image,}){
    _id = id;
    _name = name;
    _image = image;
}

  BaseBrandModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  String? _image;
BaseBrandModel copyWith({  num? id,
  String? name,
  String? image,
}) => BaseBrandModel(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
);
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}
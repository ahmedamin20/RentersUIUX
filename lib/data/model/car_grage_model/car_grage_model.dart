/// data : [{"id":1,"name":"Jazmyne Towne","brand":{"id":1,"name":"Naomie Price Jr."},"favorite":false},{"id":2,"name":"Lydia Kihn DDS","brand":{"id":1,"name":"Naomie Price Jr."},"favorite":false},{"id":3,"name":"Izabella Schulist","brand":{"id":1,"name":"Naomie Price Jr."},"favorite":false},{"id":4,"name":"Prof. Eleanora Simonis","brand":{"id":1,"name":"Naomie Price Jr."},"favorite":false},{"id":5,"name":"Dolly Terry","brand":{"id":1,"name":"Naomie Price Jr."},"favorite":false}]
/// links : {"first":"https://garage-updated-api.eductor.org/users/cars_models?page=1","last":"https://garage-updated-api.eductor.org/users/cars_models?page=1","next":null,"prev":null}
/// meta : {"current_page":1,"from":1,"last_page":1}
/// message : "Data Fetched Successfully"
/// code : 200
/// type : "success"

class CarGrageModel {
  CarGrageModel({
      List<BaseGrageModel>? data,
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

  CarGrageModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BaseGrageModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }
  List<BaseGrageModel>? _data;
  Links? _links;
  Meta? _meta;
  String? _message;
  num? _code;
  String? _type;
CarGrageModel copyWith({  List<BaseGrageModel>? data,
  Links? links,
  Meta? meta,
  String? message,
  num? code,
  String? type,
}) => CarGrageModel(  data: data ?? _data,
  links: links ?? _links,
  meta: meta ?? _meta,
  message: message ?? _message,
  code: code ?? _code,
  type: type ?? _type,
);
  List<BaseGrageModel>? get data => _data;
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

/// first : "https://garage-updated-api.eductor.org/users/cars_models?page=1"
/// last : "https://garage-updated-api.eductor.org/users/cars_models?page=1"
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
/// name : "Jazmyne Towne"
/// brand : {"id":1,"name":"Naomie Price Jr."}
/// favorite : false

class BaseGrageModel {
  BaseGrageModel({
      num? id, 
      String? name, 
      Brand? brand, 
      bool? favorite,}){
    _id = id;
    _name = name;
    _brand = brand;
    _favorite = favorite;
}

  BaseGrageModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    _favorite = json['favorite'];
  }
  num? _id;
  String? _name;
  Brand? _brand;
  bool? _favorite;
BaseGrageModel copyWith({  num? id,
  String? name,
  Brand? brand,
  bool? favorite,
}) => BaseGrageModel(  id: id ?? _id,
  name: name ?? _name,
  brand: brand ?? _brand,
  favorite: favorite ?? _favorite,
);
  num? get id => _id;
  String? get name => _name;
  Brand? get brand => _brand;
  bool? get favorite => _favorite;
  set favorite(bool? value) {
    _favorite = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    map['favorite'] = _favorite;
    return map;
  }

}

/// id : 1
/// name : "Naomie Price Jr."

class Brand {
  Brand({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Brand.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Brand copyWith({  num? id,
  String? name,
}) => Brand(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}
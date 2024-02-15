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

/// first : "https://garage-updated-api.eductor.org/mobile/client/products?page=1"
/// last : "https://garage-updated-api.eductor.org/mobile/client/products?page=1"
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
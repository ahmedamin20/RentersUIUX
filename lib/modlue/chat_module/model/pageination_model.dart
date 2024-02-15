class Meta {
  Meta({
    num? currentPage,
    num? from,
    num? lastPage,
  }) {
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

  Meta copyWith({
    num? currentPage,
    num? from,
    num? lastPage,
  }) =>
      Meta(
        currentPage: currentPage ?? _currentPage,
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

/// first : "https://api.pharosocail.com/api/chat/messages/2?page=1"
/// last : "https://api.pharosocail.com/api/chat/messages/2?page=8"
/// next : "https://api.pharosocail.com/api/chat/messages/2?page=2"

class Links {
  Links({
    String? first,
    String? last,
    String? next,
  }) {
    _first = first;
    _last = last;
    _next = next;
  }

  Links.fromJson(dynamic json) {
    _first = json['first'];
    _last = json['last'];
    _next = json['next'];
  }

  String? _first;
  String? _last;
  String? _next;

  Links copyWith({
    String? first,
    String? last,
    String? next,
  }) =>
      Links(
        first: first ?? _first,
        last: last ?? _last,
        next: next ?? _next,
      );

  String? get first => _first;

  String? get last => _last;

  String? get next => _next;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = _first;
    map['last'] = _last;
    map['next'] = _next;
    return map;
  }
}

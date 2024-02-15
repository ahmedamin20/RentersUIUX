class VisitModel {
  VisitModel({
    String? id,
    String? createdAt,
    String ? reason,
  }){
    _id = id;
    _createdAt = createdAt;
    _reason = reason;
  }

  VisitModel.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _reason = json['reason'];
  }
  String? _id;
  String? _createdAt;
  String ? _reason;
  VisitModel copyWith({  String? id,
    String? createdAt,
  }) => VisitModel(  id: id ?? _id,
    createdAt: createdAt ?? _createdAt,
    reason: _reason,
  );
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get reason => _reason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['reason'] = _reason;
    return map;
  }

}
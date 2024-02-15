class ColorModel {
  ColorModel({
    num? id,
    String? name,}){
    _id = id;
    _name = name;
  }

  ColorModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
  ColorModel copyWith({  num? id,
    String? name,
  }) => ColorModel(  id: id ?? _id,
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

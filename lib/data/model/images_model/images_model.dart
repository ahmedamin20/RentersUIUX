class ImagesModel {
  ImagesModel({
    num? id,
    String? url,}){
    _id = id;
    _url = url;
  }

  ImagesModel.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
  }
  num? _id;
  String? _url;
  ImagesModel copyWith({  num? id,
    String? url,
  }) => ImagesModel(  id: id ?? _id,
    url: url ?? _url,
  );
  num? get id => _id;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    return map;
  }

}
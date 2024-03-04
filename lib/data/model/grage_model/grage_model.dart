class GarageModel {
  GarageModel({
    num? id,
    String? name,
    String? phone,
    String? address,})
  {
    _id = id;
    _name = name;
    _phone = phone;
    _address = address;
  }

  GarageModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _address = json['address'];
  }
  num? _id;
  String? _name;
  String? _phone;
  String? _address;
  GarageModel copyWith({  num? id,
    String? name,
    String? phone,
    String? address,
  }) => GarageModel(  id: id ?? _id,
    name: name ?? _name,
    phone: phone ?? _phone,
    address: address ?? _address,
  );
  num? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['address'] = _address;
    return map;
  }

}
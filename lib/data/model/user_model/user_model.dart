
class UserModel {
  UserModel({
    dynamic? id,
    String? name,
    bool? status,
    String? phone,
    String? email,
    String? avatar,
    String? type,
    String? token,
    Location? location,
    dynamic additionalAddresses,}){
    _id = id;
    _name = name;
    _status = status;
    _phone = phone;
    _email = email;
    _avatar = avatar;
    _type = type;
    _token = token;
    _location = location;
    _additionalAddresses = additionalAddresses;
  }

  UserModel.fromMap(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _status = json['status'];
    _phone = json['phone'];
    _email = json['email'];
    _avatar = json['avatar'];
    _type = json['type'];
    _token = json['token'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _additionalAddresses = json['additional_addresses'];
  }
  dynamic? _id;
  String? _name;
  bool? _status;
  String? _phone;
  String? _email;
  String? _avatar;
  String? _type;
  String? _token;
  Location? _location;
  dynamic _additionalAddresses;
  UserModel copyWith({  dynamic? id,
    String? name,
    bool? status,
    String? phone,
    String? email,
    String? avatar,
    String? type,
    String? token,
    Location? location,
    dynamic additionalAddresses,
  }) => UserModel(  id: id ?? _id,
    name: name ?? _name,
    status: status ?? _status,
    phone: phone ?? _phone,
    email: email ?? _email,
    avatar: avatar ?? _avatar,
    type: type ?? _type,
    token: token ?? _token,
    location: location ?? _location,
    additionalAddresses: additionalAddresses ?? _additionalAddresses,
  );
  dynamic? get id => _id;
  String? get name => _name;
  bool? get status => _status;
  String? get phone => _phone;
  String? get email => _email;
  String? get avatar => _avatar;
  String? get type => _type;
  String? get token => _token;
  Location? get location => _location;
  dynamic get additionalAddresses => _additionalAddresses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['status'] = _status;
    map['phone'] = _phone;
    map['email'] = _email;
    map['avatar'] = _avatar;
    map['type'] = _type;
    map['token'] = _token;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['additional_addresses'] = _additionalAddresses;
    return map;
  }

}

/// latitude : null
/// longitude : null

class Location {
  Location({
    dynamic latitude,
    dynamic longitude,}){
    _latitude = latitude;
    _longitude = longitude;
  }

  Location.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  dynamic _latitude;
  dynamic _longitude;
  Location copyWith({  dynamic latitude,
    dynamic longitude,
  }) => Location(  latitude: latitude ?? _latitude,
    longitude: longitude ?? _longitude,
  );
  dynamic get latitude => _latitude;
  dynamic get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }

}
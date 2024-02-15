import '../car_model/car_model.dart';

class VisitorCarModel {
  VisitorCarModel({
    String? id,
    String? carLicense,
    String? carModel,
    ColorModel? color,}){
    _id = id;
    _carLicense = carLicense;
    _carModel = carModel;
    _color = color;
  }

  VisitorCarModel.fromJson(dynamic json) {
    _id = json['id'];
    _carLicense = json['car_license'];
    _carModel = json['car_model'];
    _color = json['color'] != null ? ColorModel.fromJson(json['color']) : null;
  }
  String? _id;
  String? _carLicense;
  String? _carModel;
  ColorModel? _color;
  VisitorCarModel copyWith({  String? id,
    String? carLicense,
    String? carModel,
    ColorModel? color,
  }) => VisitorCarModel(  id: id ?? _id,
    carLicense: carLicense ?? _carLicense,
    carModel: carModel ?? _carModel,
    color: color ?? _color,
  );
  String? get id => _id;
  String? get carLicense => _carLicense;
  String? get carModel => _carModel;
  ColorModel? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['car_license'] = _carLicense;
    map['car_model'] = _carModel;
    if (_color != null) {
      map['color'] = _color?.toJson();
    }
    return map;
  }

}

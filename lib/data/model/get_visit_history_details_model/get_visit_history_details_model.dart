import '../grage_model/grage_model.dart';

/// data : {"id":"2d207fec-0612-4bcf-9eb4-1472edf91c10","garage":{"id":2,"name":"Mrs.","phone":"+14796818678","address":"4370 Kuhic Orchard Apt. 573\nDomingostad, AR 14546"},"created_at":"2023-10-27 13:47","reason":"Dormouse, who seemed to have no answers.' 'If you please, sir--' The Rabbit Sends in a low voice. 'Not at all,' said the Caterpillar. 'Well, I never knew so much at this, she came upon a neat little."}
/// message : "Data Fetched Successfully"
/// code : 200
/// type : "success"

class GetVisitHistoryDetailsModel {
  GetVisitHistoryDetailsModel({
      Data? data, 
      String? message, 
      num? code, 
      String? type,}){
    _data = data;
    _message = message;
    _code = code;
    _type = type;
}

  GetVisitHistoryDetailsModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }
  Data? _data;
  String? _message;
  num? _code;
  String? _type;
GetVisitHistoryDetailsModel copyWith({  Data? data,
  String? message,
  num? code,
  String? type,
}) => GetVisitHistoryDetailsModel(  data: data ?? _data,
  message: message ?? _message,
  code: code ?? _code,
  type: type ?? _type,
);
  Data? get data => _data;
  String? get message => _message;
  num? get code => _code;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    map['code'] = _code;
    map['type'] = _type;
    return map;
  }

}

/// id : "2d207fec-0612-4bcf-9eb4-1472edf91c10"
/// garage : {"id":2,"name":"Mrs.","phone":"+14796818678","address":"4370 Kuhic Orchard Apt. 573\nDomingostad, AR 14546"}
/// created_at : "2023-10-27 13:47"
/// reason : "Dormouse, who seemed to have no answers.' 'If you please, sir--' The Rabbit Sends in a low voice. 'Not at all,' said the Caterpillar. 'Well, I never knew so much at this, she came upon a neat little."

class Data {
  Data({
      String? id, 
      GarageModel? garage,
      String? createdAt, 
      String? reason,}){
    _id = id;
    _garage = garage;
    _createdAt = createdAt;
    _reason = reason;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _garage = json['garage'] != null ? GarageModel.fromJson(json['garage']) : null;
    _createdAt = json['created_at'];
    _reason = json['reason'];
  }
  String? _id;
  GarageModel? _garage;
  String? _createdAt;
  String? _reason;
Data copyWith({  String? id,
  GarageModel? garage,
  String? createdAt,
  String? reason,
}) => Data(  id: id ?? _id,
  garage: garage ?? _garage,
  createdAt: createdAt ?? _createdAt,
  reason: reason ?? _reason,
);
  String? get id => _id;
  GarageModel? get garage => _garage;
  String? get createdAt => _createdAt;
  String? get reason => _reason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_garage != null) {
      map['garage'] = _garage?.toJson();
    }
    map['created_at'] = _createdAt;
    map['reason'] = _reason;
    return map;
  }

}

/// id : 2
/// name : "Mrs."
/// phone : "+14796818678"
/// address : "4370 Kuhic Orchard Apt. 573\nDomingostad, AR 14546"


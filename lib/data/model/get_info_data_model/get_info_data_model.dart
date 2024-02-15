/// data : {"title":"Jacobs, Hand and Kris","phones":"\"+1-510-546-2354\"","address":"1814 Stoltenberg Locks Suite 391\nO'Reillyside, NJ 23768-5900","gmail":"oswaniawski@pagac.com","facebook":"http://www.cartwright.com/placeat-quis-sed-laborum-atque","whatsapp":"http://www.pagac.com/debitis-velit-nemo-totam-mollitia-modi-aut-pariatur","instagram":"http://vandervort.com/consequatur-et-ea-sequi.html","linkedin":"http://www.jacobs.com/et-sunt-sit-et-distinctio-maxime-similique","youtube":"http://deckow.info/eius-qui-officiis-voluptatem-expedita-possimus-necessitatibus-ad","tiktok":null,"checking_amount":884}
/// message : "Data Fetched Successfully"
/// code : 200
/// type : "success"

class GetInfoDataModel {
  GetInfoDataModel({
      Data? data, 
      String? message, 
      num? code, 
      String? type,}){
    _data = data;
    _message = message;
    _code = code;
    _type = type;
}

  GetInfoDataModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }
  Data? _data;
  String? _message;
  num? _code;
  String? _type;
GetInfoDataModel copyWith({  Data? data,
  String? message,
  num? code,
  String? type,
}) => GetInfoDataModel(  data: data ?? _data,
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

/// title : "Jacobs, Hand and Kris"
/// phones : "\"+1-510-546-2354\""
/// address : "1814 Stoltenberg Locks Suite 391\nO'Reillyside, NJ 23768-5900"
/// gmail : "oswaniawski@pagac.com"
/// facebook : "http://www.cartwright.com/placeat-quis-sed-laborum-atque"
/// whatsapp : "http://www.pagac.com/debitis-velit-nemo-totam-mollitia-modi-aut-pariatur"
/// instagram : "http://vandervort.com/consequatur-et-ea-sequi.html"
/// linkedin : "http://www.jacobs.com/et-sunt-sit-et-distinctio-maxime-similique"
/// youtube : "http://deckow.info/eius-qui-officiis-voluptatem-expedita-possimus-necessitatibus-ad"
/// tiktok : null
/// checking_amount : 884

class Data {
  Data({
      String? title, 
      List<String>? phones,
      String? address, 
      String? gmail, 
      String? facebook, 
      String? whatsapp, 
      String? instagram, 
      String? linkedin, 
      String? youtube, 
      dynamic tiktok, 
      num? checkingAmount,}){
    _title = title;
    _phones = phones;
    _address = address;
    _gmail = gmail;
    _facebook = facebook;
    _whatsapp = whatsapp;
    _instagram = instagram;
    _linkedin = linkedin;
    _youtube = youtube;
    _tiktok = tiktok;
    _checkingAmount = checkingAmount;
}

  Data.fromJson(dynamic json) {
    _title = json['title'];
    _phones = List.from(json['phones'].map((e) => e).toList());
    _address = json['address'];
    _gmail = json['gmail'];
    _facebook = json['facebook'];
    _whatsapp = json['whatsapp'];
    _instagram = json['instagram'];
    _linkedin = json['linkedin'];
    _youtube = json['youtube'];
    _tiktok = json['tiktok'];
    _checkingAmount = json['checking_amount'];
  }
  String? _title;
  List<String>? _phones;
  String? _address;
  String? _gmail;
  String? _facebook;
  String? _whatsapp;
  String? _instagram;
  String? _linkedin;
  String? _youtube;
  dynamic _tiktok;
  num? _checkingAmount;
Data copyWith({  String? title,
  List<String>? phones,
  String? address,
  String? gmail,
  String? facebook,
  String? whatsapp,
  String? instagram,
  String? linkedin,
  String? youtube,
  dynamic tiktok,
  num? checkingAmount,
}) => Data(  title: title ?? _title,
  phones: phones ?? _phones,
  address: address ?? _address,
  gmail: gmail ?? _gmail,
  facebook: facebook ?? _facebook,
  whatsapp: whatsapp ?? _whatsapp,
  instagram: instagram ?? _instagram,
  linkedin: linkedin ?? _linkedin,
  youtube: youtube ?? _youtube,
  tiktok: tiktok ?? _tiktok,
  checkingAmount: checkingAmount ?? _checkingAmount,
);
  String? get title => _title;
  List<String>? get phones => _phones;
  String? get address => _address;
  String? get gmail => _gmail;
  String? get facebook => _facebook;
  String? get whatsapp => _whatsapp;
  String? get instagram => _instagram;
  String? get linkedin => _linkedin;
  String? get youtube => _youtube;
  dynamic get tiktok => _tiktok;
  num? get checkingAmount => _checkingAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['phones'] = _phones;
    map['address'] = _address;
    map['gmail'] = _gmail;
    map['facebook'] = _facebook;
    map['whatsapp'] = _whatsapp;
    map['instagram'] = _instagram;
    map['linkedin'] = _linkedin;
    map['youtube'] = _youtube;
    map['tiktok'] = _tiktok;
    map['checking_amount'] = _checkingAmount;
    return map;
  }

}
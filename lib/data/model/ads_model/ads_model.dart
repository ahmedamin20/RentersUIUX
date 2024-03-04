class AdsModel {
  List<AdsDataModel>? data;
  String? message;
  String? type;
  int? code;
  bool? showToast;

  AdsModel(
      {this.data, this.message, this.type, this.code, this.showToast});

  AdsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AdsDataModel>[];
      json['data'].forEach((v) {
        data!.add(new AdsDataModel.fromJson(v));
      });
    }
    message = json['message'];
    type = json['type'];
    code = json['code'];
    showToast = json['showToast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    data['code'] = this.code;
    data['showToast'] = this.showToast;
    return data;
  }
}

class AdsDataModel {
  int? id;
  String? title;
  String? description;
  String? discount;
  String? image;

  AdsDataModel({this.id, this.title, this.description, this.discount, this.image});

  AdsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    discount = json['discount'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['discount'] = this.discount;
    data['image'] = this.image;
    return data;
  }
}
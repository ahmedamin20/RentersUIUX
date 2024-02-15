class PostModel {
  String? message;
  String? type;
  int? code;
  bool? showToast;

  PostModel({this.message, this.type, this.code, this.showToast});

  PostModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    type = json['type'];
    code = json['code'];
    showToast = json['showToast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['type'] = this.type;
    data['code'] = this.code;
    data['showToast'] = this.showToast;
    return data;
  }
}
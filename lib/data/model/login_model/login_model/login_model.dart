class LoginModel {
  Data? data;
  String? message;
  String? type;
  int? code;
  bool? showToast;

  LoginModel({this.data, this.message, this.type, this.code, this.showToast});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
    type = json['type'];
    code = json['code'];
    showToast = json['showToast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    data['code'] = this.code;
    data['showToast'] = this.showToast;
    return data;
  }
}

class Data {
  dynamic id;
  String? name;
  String? email;
  String? avatar;
  String? type;
  String? token;

  Data({this.id, this.name, this.email, this.avatar, this.type, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    type = json['type'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['type'] = this.type;
    data['token'] = this.token;
    return data;
  }
}

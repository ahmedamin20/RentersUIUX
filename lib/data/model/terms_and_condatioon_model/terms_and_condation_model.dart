class TermsAndCondationModel {
  termsAndConfationData? data;
  String? message;
  String? type;
  int? code;
  bool? showToast;

  TermsAndCondationModel(
      {this.data, this.message, this.type, this.code, this.showToast});

  TermsAndCondationModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new termsAndConfationData.fromJson(json['data']) : null;
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

class termsAndConfationData {
  String? content;

  termsAndConfationData({this.content});

  termsAndConfationData.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    return data;
  }
}
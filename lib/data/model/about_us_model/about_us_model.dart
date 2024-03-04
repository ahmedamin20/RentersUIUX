class AboutUsModel {
  AboutUsData? data;
  String? message;
  String? type;
  int? code;
  bool? showToast;

  AboutUsModel({this.data, this.message, this.type, this.code, this.showToast});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new AboutUsData.fromJson(json['data']) : null;
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

class AboutUsData {
  String? name;
  String? description;
  String? youtubeVideoUrl;
  String? image;

  AboutUsData({this.name, this.description, this.youtubeVideoUrl, this.image});

  AboutUsData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    youtubeVideoUrl = json['youtube_video_url'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['youtube_video_url'] = this.youtubeVideoUrl;
    data['image'] = this.image;
    return data;
  }
}

class Addons {
  int? id;
  List<int>? items;

  Addons({this.id, this.items});

  Addons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    items = json['items'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['items'] = this.items;
    return data;
  }
}
class NewsSearchModel {
  String item;
  String type;
  String from;

  NewsSearchModel({this.item, this.type, this.from});

  NewsSearchModel.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    type = json['type'];
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item'] = this.item;
    data['type'] = this.type;
    data['from'] = this.from;
    return data;
  }
}

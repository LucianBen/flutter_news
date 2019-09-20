class SquareHotwordModel {
  String type;
  List<SquareHotwordItem> item;
  ChConfig chConfig;

  SquareHotwordModel({this.type, this.item, this.chConfig});

  SquareHotwordModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['item'] != null) {
      item = new List<SquareHotwordItem>();
      json['item'].forEach((v) {
        item.add(new SquareHotwordItem.fromJson(v));
      });
    }
    chConfig = json['chConfig'] != null
        ? new ChConfig.fromJson(json['chConfig'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    if (this.chConfig != null) {
      data['chConfig'] = this.chConfig.toJson();
    }
    return data;
  }
}

class SquareHotwordItem {
  String id;
  String title;
  String titleIcon;
  Link link;

  SquareHotwordItem({this.id, this.title, this.titleIcon, this.link});

  SquareHotwordItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleIcon = json['titleIcon'];
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['titleIcon'] = this.titleIcon;
    if (this.link != null) {
      data['link'] = this.link.toJson();
    }
    return data;
  }
}

class Link {
  String type;
  String url;

  Link({this.type, this.url});

  Link.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}

class ChConfig {
  String titleIcon;
  String desc;

  ChConfig({this.titleIcon, this.desc});

  ChConfig.fromJson(Map<String, dynamic> json) {
    titleIcon = json['titleIcon'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titleIcon'] = this.titleIcon;
    data['desc'] = this.desc;
    return data;
  }
}

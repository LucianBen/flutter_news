class NewsEntertainmentNavModel {
  String type;
  String id;
  String thumbnail;
  String title;
  String showType;
  String documentId;
  String staticId;
  Style style;
  Link link;
  String notShowDislikeReason;
  String reftype;
  String intro;
  String commentsall;

  NewsEntertainmentNavModel(
      {this.type,
      this.id,
      this.thumbnail,
      this.title,
      this.showType,
      this.documentId,
      this.staticId,
      this.style,
      this.link,
      this.notShowDislikeReason,
      this.reftype,
      this.intro,
      this.commentsall});

  NewsEntertainmentNavModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    showType = json['showType'];
    documentId = json['documentId'];
    staticId = json['staticId'];
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    notShowDislikeReason = json['notShowDislikeReason'];
    reftype = json['reftype'];
    intro = json['intro'];
    commentsall = json['commentsall'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['thumbnail'] = this.thumbnail;
    data['title'] = this.title;
    data['showType'] = this.showType;
    data['documentId'] = this.documentId;
    data['staticId'] = this.staticId;
    if (this.style != null) {
      data['style'] = this.style.toJson();
    }
    if (this.link != null) {
      data['link'] = this.link.toJson();
    }
    data['notShowDislikeReason'] = this.notShowDislikeReason;
    data['reftype'] = this.reftype;
    data['intro'] = this.intro;
    data['commentsall'] = this.commentsall;
    return data;
  }
}

class Style {
  String view;
  List<String> backreason;
  String defaultreason;

  Style({this.view, this.backreason, this.defaultreason});

  Style.fromJson(Map<String, dynamic> json) {
    view = json['view'];
    backreason =
        json['backreason'] == null ? [] : json['backreason'].cast<String>();
    defaultreason = json['defaultreason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['view'] = this.view;
    data['backreason'] = this.backreason;
    data['defaultreason'] = this.defaultreason;
    return data;
  }
}

class Link {
  String type;
  String url;
  String weburl;

  Link({this.type, this.url, this.weburl});

  Link.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
    weburl = json['weburl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    data['weburl'] = this.weburl;
    return data;
  }
}

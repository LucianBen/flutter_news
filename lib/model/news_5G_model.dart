class News5GModel {
  String type;
  String id;
  String thumbnail;
  String title;
  String showType;
  String source;
  Subscribe subscribe;
  String documentId;
  String staticId;
  Style style;
  String commentsUrl;
  String comments;
  String commentsall;
  Link link;
  String notShowDislikeReason;
  String reftype;
  String intro;

  News5GModel(
      {this.type,
      this.id,
      this.thumbnail,
      this.title,
      this.showType,
      this.source,
      this.subscribe,
      this.documentId,
      this.staticId,
      this.style,
      this.commentsUrl,
      this.comments,
      this.commentsall,
      this.link,
      this.notShowDislikeReason,
      this.reftype,
      this.intro});

  News5GModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    showType = json['showType'];
    source = json['source'];
    subscribe = json['subscribe'] != null
        ? new Subscribe.fromJson(json['subscribe'])
        : null;
    documentId = json['documentId'];
    staticId = json['staticId'];
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    commentsUrl = json['commentsUrl'];
    comments = json['comments'];
    commentsall = json['commentsall'];
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    notShowDislikeReason = json['notShowDislikeReason'];
    reftype = json['reftype'];
    intro = json['intro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['thumbnail'] = this.thumbnail;
    data['title'] = this.title;
    data['showType'] = this.showType;
    data['source'] = this.source;
    if (this.subscribe != null) {
      data['subscribe'] = this.subscribe.toJson();
    }
    data['documentId'] = this.documentId;
    data['staticId'] = this.staticId;
    if (this.style != null) {
      data['style'] = this.style.toJson();
    }
    data['commentsUrl'] = this.commentsUrl;
    data['comments'] = this.comments;
    data['commentsall'] = this.commentsall;
    if (this.link != null) {
      data['link'] = this.link.toJson();
    }
    data['notShowDislikeReason'] = this.notShowDislikeReason;
    data['reftype'] = this.reftype;
    data['intro'] = this.intro;
    return data;
  }
}

class Subscribe {
  String cateid;
  String catename;
  String type;

  Subscribe({this.cateid, this.catename, this.type});

  Subscribe.fromJson(Map<String, dynamic> json) {
    cateid = json['cateid'];
    catename = json['catename'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cateid'] = this.cateid;
    data['catename'] = this.catename;
    data['type'] = this.type;
    return data;
  }
}

class Style {
  List<String> backreason;
  String defaultreason;
  String view;

  Style({this.backreason, this.defaultreason, this.view});

  Style.fromJson(Map<String, dynamic> json) {
    backreason = json['backreason'].cast<String>();
    defaultreason = json['defaultreason'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backreason'] = this.backreason;
    data['defaultreason'] = this.defaultreason;
    data['view'] = this.view;
    return data;
  }
}

class Link {
  String type;
  String url;
  String openType;
  String weburl;

  Link({this.type, this.url, this.openType, this.weburl});

  Link.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
    openType = json['openType'];
    weburl = json['weburl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    data['openType'] = this.openType;
    data['weburl'] = this.weburl;
    return data;
  }
}

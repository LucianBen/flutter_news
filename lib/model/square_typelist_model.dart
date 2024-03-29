class SquareTypeListModel {
  String type;
  String id;
  String title;
  String updateTime;
  String documentId;
  String staticId;
  Style style;
  Link link;
  String titleIcon;
  String reftype;
  String intro;
  String comments;
  String commentsall;
  List<MarqueeList> marqueeList;
  List<Relation> relation;
  String showType;
  String source;
  String thumbnail;
  String subTitle;

  SquareTypeListModel(
      {this.type,
      this.id,
      this.title,
      this.updateTime,
      this.documentId,
      this.staticId,
      this.style,
      this.link,
      this.titleIcon,
      this.reftype,
      this.intro,
      this.comments,
      this.commentsall,
      this.marqueeList,
      this.relation,
      this.thumbnail,
      this.source,
      this.showType,
      this.subTitle});

  SquareTypeListModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    title = json['title'];
    updateTime = json['updateTime'];
    documentId = json['documentId'];
    staticId = json['staticId'];
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    titleIcon = json['titleIcon'];
    reftype = json['reftype'];
    intro = json['intro'];
    comments = json['comments'];
    commentsall = json['commentsall'];
    if (json['marqueeList'] != null) {
      marqueeList = new List<MarqueeList>();
      json['marqueeList'].forEach((v) {
        marqueeList.add(new MarqueeList.fromJson(v));
      });
    }
    if (json['relation'] != null) {
      relation = new List<Relation>();
      json['relation'].forEach((v) {
        relation.add(new Relation.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'];
    source = json['source'];
    showType = json['showType'];
    subTitle = json['subTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['title'] = this.title;
    data['updateTime'] = this.updateTime;
    data['documentId'] = this.documentId;
    data['staticId'] = this.staticId;
    if (this.style != null) {
      data['style'] = this.style.toJson();
    }
    if (this.link != null) {
      data['link'] = this.link.toJson();
    }
    data['titleIcon'] = this.titleIcon;
    data['reftype'] = this.reftype;
    data['intro'] = this.intro;
    data['comments'] = this.comments;
    data['commentsall'] = this.commentsall;
    if (this.marqueeList != null) {
      data['marqueeList'] = this.marqueeList.map((v) => v.toJson()).toList();
    }
    if (this.relation != null) {
      data['relation'] = this.relation.map((v) => v.toJson()).toList();
    }
    data['thumbnail'] = this.thumbnail;
    data['source'] = this.source;
    data['showType'] = this.showType;
    data['subTitle'] = this.subTitle;
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

class MarqueeList {
  String type;
  String id;
  String thumbnail;
  String title;
  String showType;
  Phvideo phvideo;
  String commentsUrl;
  Subscribe subscribe;
  String documentId;
  String staticId;
  Style style;
  String comments;
  String commentsall;
  Link link;
  String notShowDislikeReason;
  String reftype;
  String intro;
  String source;
  String columnName;

  MarqueeList(
      {this.type,
      this.id,
      this.thumbnail,
      this.title,
      this.showType,
      this.phvideo,
      this.commentsUrl,
      this.subscribe,
      this.documentId,
      this.staticId,
      this.style,
      this.comments,
      this.commentsall,
      this.link,
      this.notShowDislikeReason,
      this.reftype,
        this.intro,
      this.source,
      this.columnName});

  MarqueeList.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    showType = json['showType'];
    phvideo =
        json['phvideo'] != null ? new Phvideo.fromJson(json['phvideo']) : null;
    commentsUrl = json['commentsUrl'];
    subscribe = json['subscribe'] != null
        ? new Subscribe.fromJson(json['subscribe'])
        : null;
    documentId = json['documentId'];
    staticId = json['staticId'];
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    comments = json['comments'];
    commentsall = json['commentsall'];
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    notShowDislikeReason = json['notShowDislikeReason'];
    reftype = json['reftype'];
    intro = json['intro'];
    source = json['source'];
    columnName = json['columnName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['thumbnail'] = this.thumbnail;
    data['title'] = this.title;
    data['showType'] = this.showType;
    if (this.phvideo != null) {
      data['phvideo'] = this.phvideo.toJson();
    }
    data['commentsUrl'] = this.commentsUrl;
    if (this.subscribe != null) {
      data['subscribe'] = this.subscribe.toJson();
    }
    data['documentId'] = this.documentId;
    data['staticId'] = this.staticId;
    if (this.style != null) {
      data['style'] = this.style.toJson();
    }
    data['comments'] = this.comments;
    data['commentsall'] = this.commentsall;
    if (this.link != null) {
      data['link'] = this.link.toJson();
    }
    data['notShowDislikeReason'] = this.notShowDislikeReason;
    data['reftype'] = this.reftype;
    data['intro'] = this.intro;
    data['source'] = this.source;
    data['columnName'] = this.columnName;
    return data;
  }
}

class Relation {
  String type;
  String thumbnail;
  String title;
  String id;
  String documentId;
  String staticId;
  String pv;
  Null updateTime;
  Style style;
  List<Relation1> relation;
  String reftype;
  String recomToken;
  String payload;
  Link link;

  Relation(
      {this.type,
      this.thumbnail,
      this.title,
      this.id,
      this.documentId,
      this.staticId,
      this.pv,
      this.updateTime,
      this.style,
      this.relation,
      this.reftype,
      this.recomToken,
      this.payload,
      this.link});

  Relation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    id = json['id'];
    documentId = json['documentId'];
    staticId = json['staticId'];
    pv = json['pv'];
    updateTime = json['updateTime'];
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    if (json['relation'] != null) {
      relation = new List<Relation1>();
      json['relation'].forEach((v) {
        relation.add(new Relation1.fromJson(v));
      });
    }
    reftype = json['reftype'];
    recomToken = json['recomToken'];
    payload = json['payload'];
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['thumbnail'] = this.thumbnail;
    data['title'] = this.title;
    data['id'] = this.id;
    data['documentId'] = this.documentId;
    data['staticId'] = this.staticId;
    data['pv'] = this.pv;
    data['updateTime'] = this.updateTime;
    if (this.style != null) {
      data['style'] = this.style.toJson();
    }
    if (this.relation != null) {
      data['relation'] = this.relation.map((v) => v.toJson()).toList();
    }
    data['reftype'] = this.reftype;
    data['recomToken'] = this.recomToken;
    data['payload'] = this.payload;
    if (this.link != null) {
      data['link'] = this.link.toJson();
    }
    return data;
  }
}

class Relation1 {
  String title;
  String id;

  Relation1({this.title, this.id});

  Relation1.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    return data;
  }
}

class Phvideo {
  String channelName;
  String columnid;
  String path;
  String filesize;
  int length;

  Phvideo(
      {this.channelName, this.columnid, this.path, this.filesize, this.length});

  Phvideo.fromJson(Map<String, dynamic> json) {
    channelName = json['channelName'];
    columnid = json['columnid'];
    path = json['path'];
    filesize = json['filesize'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelName'] = this.channelName;
    data['columnid'] = this.columnid;
    data['path'] = this.path;
    data['filesize'] = this.filesize;
    data['length'] = this.length;
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

class Link {
  String type;
  String url;
  String weburl;
  String title;
  String openType;

  Link({this.type, this.url, this.weburl, this.title, this.openType});

  Link.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
    weburl = json['weburl'];
    title = json['title'];
    openType = json['openType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    data['weburl'] = this.weburl;
    data['title'] = this.title;
    data['openType'] = this.openType;
    return data;
  }
}

/*直播室*/
class NewsFinanceLiveRoomModel {
  String type;
  String id;
  String thumbnail;
  String title;
  String documentId;
  String staticId;
  StyleLiveRoom style;
  Link link;
  String titleIcon;
  List<MarqueeList> marqueeList;
  String updateTime;
  String reftype;
  String intro;
  String commentsall;

  NewsFinanceLiveRoomModel(
      {this.type,
      this.id,
      this.thumbnail,
      this.title,
      this.documentId,
      this.staticId,
      this.style,
      this.link,
      this.titleIcon,
      this.marqueeList,
      this.updateTime,
      this.reftype,
      this.intro,
      this.commentsall});

  NewsFinanceLiveRoomModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    documentId = json['documentId'];
    staticId = json['staticId'];
    style = json['style'] != null
        ? new StyleLiveRoom.fromJson(json['style'])
        : null;
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    titleIcon = json['titleIcon'];
    if (json['marqueeList'] != null) {
      marqueeList = new List<MarqueeList>();
      json['marqueeList'].forEach((v) {
        marqueeList.add(new MarqueeList.fromJson(v));
      });
    }
    updateTime = json['updateTime'];
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
    data['documentId'] = this.documentId;
    data['staticId'] = this.staticId;
    if (this.style != null) {
      data['style'] = this.style.toJson();
    }
    if (this.link != null) {
      data['link'] = this.link.toJson();
    }
    data['titleIcon'] = this.titleIcon;
    if (this.marqueeList != null) {
      data['marqueeList'] = this.marqueeList.map((v) => v.toJson()).toList();
    }
    data['updateTime'] = this.updateTime;
    data['reftype'] = this.reftype;
    data['intro'] = this.intro;
    data['commentsall'] = this.commentsall;
    return data;
  }
}

class MarqueeList {
  String title;
  String staticId;
  Link link;
  String updateTime;
  String documentId;
  String commentsall;

  MarqueeList(
      {this.title,
      this.staticId,
      this.link,
      this.updateTime,
      this.documentId,
      this.commentsall});

  MarqueeList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    staticId = json['staticId'];
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    updateTime = json['updateTime'];
    documentId = json['documentId'];
    commentsall = json['commentsall'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['staticId'] = this.staticId;
    if (this.link != null) {
      data['link'] = this.link.toJson();
    }
    data['updateTime'] = this.updateTime;
    data['documentId'] = this.documentId;
    data['commentsall'] = this.commentsall;
    return data;
  }
}

class StyleLiveRoom {
  String view;
  List<String> backreason;
  String defaultreason;

  StyleLiveRoom({this.view, this.backreason, this.defaultreason});

  StyleLiveRoom.fromJson(Map<String, dynamic> json) {
    view = json['view'];
    backreason = json['backreason'].cast<String>();
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

/*新闻列表*/
class NewsListModel {
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
  bool hasSlide;
  String commentsUrl;
  String comments;
  String commentsall;
  Link link;
  Phvideo phvideo;
  String reftype;
  String simId;
  String recomToken;
  String intro;

  NewsListModel(
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
      this.hasSlide,
      this.commentsUrl,
      this.comments,
      this.commentsall,
      this.link,
      this.reftype,
      this.simId,
      this.recomToken,
      this.intro});

  NewsListModel.fromJson(Map<String, dynamic> json) {
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
    hasSlide = json['hasSlide'];
    commentsUrl = json['commentsUrl'];
    comments = json['comments'];
    commentsall = json['commentsall'];
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    phvideo = json['phvideo'] != null ? new Phvideo.fromJson(json['phvideo']) : null;
    reftype = json['reftype'];
    simId = json['simId'];
    recomToken = json['recomToken'];
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
    data['hasSlide'] = this.hasSlide;
    data['commentsUrl'] = this.commentsUrl;
    data['comments'] = this.comments;
    data['commentsall'] = this.commentsall;
    if (this.link != null) {
      data['link'] = this.link.toJson();
    }
    data['reftype'] = this.reftype;
    data['simId'] = this.simId;
    data['recomToken'] = this.recomToken;
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
  String type;
  List<String> images;
  List<String> backreason;
  String defaultreason;
  int slideCount;
  String view;

  Style(
      {this.type,
      this.images,
      this.backreason,
      this.defaultreason,
      this.slideCount,
      this.view});

  Style.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    images = json['images'] == null ? null : json['images'].cast<String>();
    backreason =
        json['backreason'] == null ? null : json['backreason'].cast<String>();
    defaultreason = json['defaultreason'];
    slideCount = json['slideCount'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['images'] = this.images;
    data['backreason'] = this.backreason;
    data['defaultreason'] = this.defaultreason;
    data['slideCount'] = this.slideCount;
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

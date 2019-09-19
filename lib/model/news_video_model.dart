class NewsVideoModel {
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
  Link link;
  String reftype;
  String simId;
  String recomToken;
  String intro;
  String comments;
  String commentsall;

  NewsVideoModel(
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
        this.link,
        this.reftype,
        this.simId,
        this.recomToken,
        this.intro,
        this.comments,
        this.commentsall});

  NewsVideoModel.fromJson(Map<String, dynamic> json) {
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
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    reftype = json['reftype'];
    simId = json['simId'];
    recomToken = json['recomToken'];
    intro = json['intro'];
    comments = json['comments'];
    commentsall = json['commentsall'];
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
    if (this.link != null) {
      data['link'] = this.link.toJson();
    }
    data['reftype'] = this.reftype;
    data['simId'] = this.simId;
    data['recomToken'] = this.recomToken;
    data['intro'] = this.intro;
    data['comments'] = this.comments;
    data['commentsall'] = this.commentsall;
    return data;
  }
}

class Phvideo {
  String channelName;
  String columnid;
  String path;
  String filesize;
  int length;
  String playTime;
  String praise;
  String tread;

  Phvideo(
      {this.channelName,
        this.columnid,
        this.path,
        this.filesize,
        this.length,
        this.playTime,
        this.praise,
        this.tread});

  Phvideo.fromJson(Map<String, dynamic> json) {
    channelName = json['channelName'];
    columnid = json['columnid'];
    path = json['path'];
    filesize = json['filesize'];
    length = json['length'];
    playTime = json['playTime'];
    praise = json['praise'];
    tread = json['tread'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelName'] = this.channelName;
    data['columnid'] = this.columnid;
    data['path'] = this.path;
    data['filesize'] = this.filesize;
    data['length'] = this.length;
    data['playTime'] = this.playTime;
    data['praise'] = this.praise;
    data['tread'] = this.tread;
    return data;
  }
}

class Subscribe {
  String cateid;
  String catename;
  String type;
  String logo;

  Subscribe({this.cateid, this.catename, this.type, this.logo});

  Subscribe.fromJson(Map<String, dynamic> json) {
    cateid = json['cateid'];
    catename = json['catename'];
    type = json['type'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cateid'] = this.cateid;
    data['catename'] = this.catename;
    data['type'] = this.type;
    data['logo'] = this.logo;
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
  String weburl;
  String vid;
  String mp4;

  Link({this.type, this.url, this.weburl, this.vid, this.mp4});

  Link.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
    weburl = json['weburl'];
    vid = json['vid'];
    mp4 = json['mp4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    data['weburl'] = this.weburl;
    data['vid'] = this.vid;
    data['mp4'] = this.mp4;
    return data;
  }
}

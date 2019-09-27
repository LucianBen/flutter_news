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

class NewsFinanceRealtime{
  String name;
  String last;
  String hstClose;
  String chg;
  String chgPct;
  String open;
  String high;
  String low;
  String time;

  NewsFinanceRealtime(
      {this.name,
        this.last,
        this.hstClose,
        this.chg,
        this.chgPct,
        this.open,
        this.high,
        this.low,
        this.time});

  NewsFinanceRealtime.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    last = json['last'];
    hstClose = json['hst_close'];
    chg = json['chg'];
    chgPct = json['chg_pct'];
    open = json['open'];
    high = json['high'];
    low = json['low'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['last'] = this.last;
    data['hst_close'] = this.hstClose;
    data['chg'] = this.chg;
    data['chg_pct'] = this.chgPct;
    data['open'] = this.open;
    data['high'] = this.high;
    data['low'] = this.low;
    data['time'] = this.time;
    return data;
  }
}
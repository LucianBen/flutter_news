class NewsDetailModel {
  String newStatus;
  String documentId;
  String staticId;
  String title;
  String shareTitle;
  String thumbnail;
  List<String> algorithmCateData;
  String source;
  String author;
  String showclient;
  String editorcode;
  String editTime;
  String updateTime;
  String wapurl;
  String introduction;
  String wwwurl;
  String commentsUrl;
  int commentCount;
  String text;
  List<Img> img;
  String summary;
  String sharesummary;
  String commentType;
  List<String> itags;
  String featureChannel;
  List<String> iwords;
  String wemediaEAccountId;
  Subscribe subscribe;
  String shareurl;
  String praise;
  String likeNum;
  int canListen;
  String isExtend;
  String extendPercent;
  String extendLimit;
  String notShowDislikeReason;
  List<String> backreason;
  String miniProgramStatus;
  String miniProgramPath;
  String feedsSwitch;
  int showAdvert;
  String serverTime;

  NewsDetailModel(
      {this.newStatus,
        this.documentId,
        this.staticId,
        this.title,
        this.shareTitle,
        this.thumbnail,
        this.algorithmCateData,
        this.source,
        this.author,
        this.showclient,
        this.editorcode,
        this.editTime,
        this.updateTime,
        this.wapurl,
        this.introduction,
        this.wwwurl,
        this.commentsUrl,
        this.commentCount,
        this.text,
        this.img,
        this.summary,
        this.sharesummary,
        this.commentType,
        this.itags,
        this.featureChannel,
        this.iwords,
        this.wemediaEAccountId,
        this.subscribe,
        this.shareurl,
        this.praise,
        this.likeNum,
        this.canListen,
        this.isExtend,
        this.extendPercent,
        this.extendLimit,
        this.notShowDislikeReason,
        this.backreason,
        this.miniProgramStatus,
        this.miniProgramPath,
        this.feedsSwitch,
        this.showAdvert,
        this.serverTime});

  NewsDetailModel.fromJson(Map<String, dynamic> json) {
    newStatus = json['newStatus'];
    documentId = json['documentId'];
    staticId = json['staticId'];
    title = json['title'];
    shareTitle = json['shareTitle'];
    thumbnail = json['thumbnail'];
    algorithmCateData = json['algorithmCateData'].cast<String>();
    source = json['source'];
    author = json['author'];
    showclient = json['showclient'];
    editorcode = json['editorcode'];
    editTime = json['editTime'];
    updateTime = json['updateTime'];
    wapurl = json['wapurl'];
    introduction = json['introduction'];
    wwwurl = json['wwwurl'];
    commentsUrl = json['commentsUrl'];
    commentCount = json['commentCount'];
    text = json['text'];
    if (json['img'] != null) {
      img = new List<Img>();
      json['img'].forEach((v) {
        img.add(new Img.fromJson(v));
      });
    }
    summary = json['summary'];
    sharesummary = json['sharesummary'];
    commentType = json['commentType'];
    itags = json['itags'].cast<String>();
    featureChannel = json['featureChannel'];
    iwords = json['iwords'].cast<String>();
    wemediaEAccountId = json['wemediaEAccountId'];
    subscribe = json['subscribe'] != null
        ? new Subscribe.fromJson(json['subscribe'])
        : null;
    shareurl = json['shareurl'];
    praise = json['praise'];
    likeNum = json['like_num'];
    canListen = json['canListen'];
    isExtend = json['isExtend'];
    extendPercent = json['extendPercent'];
    extendLimit = json['extendLimit'];
    notShowDislikeReason = json['notShowDislikeReason'];
    backreason = json['backreason'].cast<String>();
    miniProgramStatus = json['miniProgramStatus'];
    miniProgramPath = json['miniProgramPath'];
    feedsSwitch = json['feedsSwitch'];
    showAdvert = json['showAdvert'];
    serverTime = json['serverTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newStatus'] = this.newStatus;
    data['documentId'] = this.documentId;
    data['staticId'] = this.staticId;
    data['title'] = this.title;
    data['shareTitle'] = this.shareTitle;
    data['thumbnail'] = this.thumbnail;
    data['algorithmCateData'] = this.algorithmCateData;
    data['source'] = this.source;
    data['author'] = this.author;
    data['showclient'] = this.showclient;
    data['editorcode'] = this.editorcode;
    data['editTime'] = this.editTime;
    data['updateTime'] = this.updateTime;
    data['wapurl'] = this.wapurl;
    data['introduction'] = this.introduction;
    data['wwwurl'] = this.wwwurl;
    data['commentsUrl'] = this.commentsUrl;
    data['commentCount'] = this.commentCount;
    data['text'] = this.text;
    if (this.img != null) {
      data['img'] = this.img.map((v) => v.toJson()).toList();
    }
    data['summary'] = this.summary;
    data['sharesummary'] = this.sharesummary;
    data['commentType'] = this.commentType;
    data['itags'] = this.itags;
    data['featureChannel'] = this.featureChannel;
    data['iwords'] = this.iwords;
    data['wemediaEAccountId'] = this.wemediaEAccountId;
    if (this.subscribe != null) {
      data['subscribe'] = this.subscribe.toJson();
    }
    data['shareurl'] = this.shareurl;
    data['praise'] = this.praise;
    data['like_num'] = this.likeNum;
    data['canListen'] = this.canListen;
    data['isExtend'] = this.isExtend;
    data['extendPercent'] = this.extendPercent;
    data['extendLimit'] = this.extendLimit;
    data['notShowDislikeReason'] = this.notShowDislikeReason;
    data['backreason'] = this.backreason;
    data['miniProgramStatus'] = this.miniProgramStatus;
    data['miniProgramPath'] = this.miniProgramPath;
    data['feedsSwitch'] = this.feedsSwitch;
    data['showAdvert'] = this.showAdvert;
    data['serverTime'] = this.serverTime;
    return data;
  }
}

class Img {
  String url;
  Size size;

  Img({this.url, this.size});

  Img.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    if (this.size != null) {
      data['size'] = this.size.toJson();
    }
    return data;
  }
}

class Size {
  String width;
  String height;

  Size({this.width, this.height});

  Size.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class Subscribe {
  String type;
  String cateSource;
  String parentid;
  String parentname;
  String cateid;
  String catename;
  String logo;
  String description;
  String api;
  int showLink;
  String shareUrl;
  int eAccountId;
  int status;
  String honorName;
  String honorImg;
  String declare;

  Subscribe(
      {this.type,
        this.cateSource,
        this.parentid,
        this.parentname,
        this.cateid,
        this.catename,
        this.logo,
        this.description,
        this.api,
        this.showLink,
        this.shareUrl,
        this.eAccountId,
        this.status,
        this.honorName,
        this.honorImg,
        this.declare});

  Subscribe.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    cateSource = json['cateSource'];
    parentid = json['parentid'];
    parentname = json['parentname'];
    cateid = json['cateid'];
    catename = json['catename'];
    logo = json['logo'];
    description = json['description'];
    api = json['api'];
    showLink = json['show_link'];
    shareUrl = json['share_url'];
    eAccountId = json['eAccountId'];
    status = json['status'];
    honorName = json['honorName'];
    honorImg = json['honorImg'];
    declare = json['declare'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['cateSource'] = this.cateSource;
    data['parentid'] = this.parentid;
    data['parentname'] = this.parentname;
    data['cateid'] = this.cateid;
    data['catename'] = this.catename;
    data['logo'] = this.logo;
    data['description'] = this.description;
    data['api'] = this.api;
    data['show_link'] = this.showLink;
    data['share_url'] = this.shareUrl;
    data['eAccountId'] = this.eAccountId;
    data['status'] = this.status;
    data['honorName'] = this.honorName;
    data['honorImg'] = this.honorImg;
    data['declare'] = this.declare;
    return data;
  }
}

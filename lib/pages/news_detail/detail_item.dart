import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_news/model/news_detail_model.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailBody extends StatelessWidget {
  NewsDetailModel newsDetailModel;

  DetailBody(this.newsDetailModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              _title(newsDetailModel.title),
              _author(newsDetailModel.updateTime, newsDetailModel.subscribe),
              _reprint(newsDetailModel.subscribe.declare),
              _context(newsDetailModel.text),
              _likes(newsDetailModel.likeNum),
              _hotComments(),
              _moreNews()
            ],
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: _writeComment(),
          )
        ],
      ),
    );
  }

  Widget _writeComment() {
    return Container(
      child: Container(),
    );
  }

  Widget _title(String title) {
    return Container(
      color: ThemeColors.colorWhite,
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: ScreenUtil().setSp(50),
            color: ThemeColors.colorBlack),
      ),
    );
  }

  Widget _author(String updateTime, Subscribe subscribe) {
    return Container(
      color: ThemeColors.colorWhite,
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Image.network(
            subscribe.logo,
            width: ScreenUtil().setWidth(95),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: ScreenUtil().setWidth(750),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(subscribe.catename,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(40),
                            color: ThemeColors.colorBlack)),
                    Image.asset(
                      "images/share_card_wemedia.png",
                      width: ScreenUtil().setWidth(100),
                    ),
                  ],
                ),
                Text(
                  updateTime,
                  style: TextStyle(fontSize: ScreenUtil().setSp(35)),
                )
              ],
            ),
          ),
          Image.asset(
            "images/icon_follow_normal.png",
            width: ScreenUtil().setWidth(150),
          )
        ],
      ),
    );
  }

  Widget _reprint(String declare) {
    return Container(
      color: ThemeColors.colorWhite,
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Text(
        declare,
        style: TextStyle(
            color: ThemeColors.colorGrey_2, fontSize: ScreenUtil().setSp(32)),
      ),
    );
  }

  Widget _context(String text) {
    return Container(
      color: ThemeColors.colorWhite,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Html(data: text),
    );
  }

  Widget _likes(String likeNum) {
    return Container(
      color: ThemeColors.colorWhite,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(300),
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                border:
                    Border.all(width: 2, color: ThemeColors.colorBackground)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/likeview_heart_default.png",
                  width: ScreenUtil().setWidth(75),
                ),
                Text(likeNum)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50),
            width: ScreenUtil().setWidth(300),
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                border:
                    Border.all(width: 2, color: ThemeColors.colorBackground)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/likeview_heart_default.png",
                  width: ScreenUtil().setWidth(75),
                ),
                Text("不喜欢")
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _hotComments() {
    return Container(
      color: ThemeColors.colorWhite,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "热门评论",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: ThemeColors.colorBlack,
                fontSize: ScreenUtil().setSp(40)),
          )
        ],
      ),
    );
  }

  Widget _moreNews() {
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_finance_model.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//财经实时消息
class FundIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(280),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ThemeColors.colorWhite,
            border:
                Border(bottom: BorderSide(color: ThemeColors.colorBackground))),
        child: Row(
          children: <Widget>[
            fundIndexItem(true),
            fundIndexItem(false),
            fundIndexItem(true),
          ],
        ));
  }

  Widget fundIndexItem(bool isRed) {
    return Container(
      width: ScreenUtil().setWidth(360),
      decoration: BoxDecoration(
          border:
              Border(right: BorderSide(color: ThemeColors.colorBackground))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "上证指数",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(40),
                color: ThemeColors.colorBlack),
          ),
          Text(
            "3034.69",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(50),
                color: isRed ? ThemeColors.colorRed : ThemeColors.colorGreen),
          ),
          Text(
            "3.29  0.56%",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(40),
                color: isRed ? ThemeColors.colorRed : ThemeColors.colorGreen),
          ),
        ],
      ),
    );
  }
}

//直播室
class LiveRoom extends StatelessWidget {
  List<NewsFinanceLiveRoomModel> newsFinanceLiveRoomItem;

  LiveRoom(this.newsFinanceLiveRoomItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(200),
      decoration: BoxDecoration(
          color: ThemeColors.colorWhite,
          border:
              Border(bottom: BorderSide(color: ThemeColors.colorBackground))),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(180),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(color: ThemeColors.colorBackground))),
            child: Image.network(newsFinanceLiveRoomItem[0].thumbnail),
          ),
          Container(
            width: ScreenUtil().setWidth(840),
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Text(
              newsFinanceLiveRoomItem[0].marqueeList[3].title,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(45),
                  color: ThemeColors.colorBlack),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_finance_model.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//财经实时消息
class FundIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    Timer.periodic(Duration(seconds: 60), (timer) {
//
//    });

    return FutureBuilder(
        future: getRequset("newsFinanceRealtime"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsFinanceRealtime> realtime =
                (json.decode(snapshot.data.toString()) as List)
                    .map((i) => NewsFinanceRealtime.fromJson(i))
                    .toList();
            return Container(
              width: ScreenUtil().setWidth(1080),
              height: ScreenUtil().setHeight(280),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ThemeColors.colorWhite,
                  border: Border(
                      bottom: BorderSide(color: ThemeColors.colorBackground))),
              child: Row(
                children: <Widget>[
                  fundIndexItem(context, realtime[0]),
                  fundIndexItem(context, realtime[1]),
                  fundIndexItem(context, realtime[5]),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }

  fundIndexItem(BuildContext context, NewsFinanceRealtime realtime) {
    return Container(
      width: ScreenUtil().setWidth(360),
      decoration: BoxDecoration(
          border:
              Border(right: BorderSide(color: ThemeColors.colorBackground))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${realtime.name}",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(40),
                color: ThemeColors.colorBlack),
          ),
          Text(
            "${realtime.last}",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(50),
                color: double.parse(realtime.chg) < 0
                    ? ThemeColors.colorGreen
                    : ThemeColors.colorRed),
          ),
          Text(
            "${realtime.chg}  ${realtime.chgPct}%",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(40),
                color: double.parse(realtime.chg) < 0
                    ? ThemeColors.colorGreen
                    : ThemeColors.colorRed),
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

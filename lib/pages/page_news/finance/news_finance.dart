import 'package:flutter/material.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///新闻-财经
class NewsFinance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.colorWhite,
      child: ListView(
        children: <Widget>[
          fundIndex(),
          liveRoom(),
          financeNewsList(),
        ],
      ),
    );
  }
}

//基金板块
Widget fundIndex() {
  return Container(
    width: ScreenUtil().setWidth(1080),
    height: ScreenUtil().setHeight(280),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ThemeColors.colorBackground))),
    child: Row(
      children: <Widget>[
        fundIndexItem(true),
        fundIndexItem(false),
        fundIndexItem(true),
      ],
    ),
  );
}

Widget fundIndexItem(bool isRed) {
  return Container(
    width: ScreenUtil().setWidth(360),
    decoration: BoxDecoration(
        border: Border(right: BorderSide(color: ThemeColors.colorBackground))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "上证指数",
          style: TextStyle(
              fontSize: ScreenUtil().setSp(40), color: ThemeColors.colorBlack),
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

//直播室
Widget liveRoom() {
  return Container(
    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
    width: ScreenUtil().setWidth(1080),
    height: ScreenUtil().setHeight(200),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ThemeColors.colorBackground))),
    child: Row(
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(180),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(color: ThemeColors.colorBackground))),
          child: Image.network(
              "https://x0.ifengimg.com/ucms/2019_34/4C95D7866CB744F34DB17650548EEEBE3ED8271A_w147_h126.png"),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
          child: Text(
            "娃哈哈",
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

//ListView新闻
Widget financeNewsList() {
  return Container();
}

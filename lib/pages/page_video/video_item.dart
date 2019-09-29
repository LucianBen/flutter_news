import 'package:flutter/material.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///签到
class UnLoginSign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 10),
      child: Container(
        width: ScreenUtil().setWidth(220),
        padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            border: Border.all(color: ThemeColors.colorGrey_10, width: 1)),
        child: Row(
          children: <Widget>[
            Image.asset(
              "images/sign_in.png",
              width: ScreenUtil().setWidth(50),
            ),
            Text(
              "  签到",
              style: TextStyle(
                  color: ThemeColors.colorBlack,
                  fontSize: ScreenUtil().setSp(40)),
            )
          ],
        ),
      ),
    );
  }
}

///登录、注册
class UnLoginRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 10),
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(750),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ThemeColors.colorBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ThemeColors.colorGrey_10, width: 1),
          boxShadow: [
            BoxShadow(
                color: ThemeColors.colorGrey_10,
                blurRadius: 3.0,
                spreadRadius: 1.0)
          ]),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _unLoginRegisterImage("images/icon_weibo.png"),
              _unLoginRegisterImage("images/icon_weibo.png"),
              _unLoginRegisterImage("images/icon_weibo.png"),
              _unLoginRegisterImage("images/icon_weibo.png"),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            decoration: BoxDecoration(
                color: ThemeColors.colorRed,
                borderRadius: BorderRadius.circular(90)),
            child: Text(
              "登录/注册",
              style: TextStyle(
                  color: ThemeColors.colorWhite,
                  fontSize: ScreenUtil().setSp(45)),
            ),
          ),
          Row(
            children: <Widget>[
              _unLoginRegisterText("images/user_collect.png", "收藏"),
              _unLoginRegisterText("images/user_collect.png", "关注"),
              _unLoginRegisterText("images/user_history.png", "历史"),
            ],
          )
        ],
      ),
    );
  }

  //上方4个图片
  Widget _unLoginRegisterImage(String imgUrl) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: ScreenUtil().setWidth(235),
      child: Image.asset(
        imgUrl,
        height: ScreenUtil().setHeight(100),
      ),
    );
  }

  //下方3个图片和文字
  Widget _unLoginRegisterText(String imgUrl, String text) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 20),
      width: ScreenUtil().setWidth(310),
      child: Column(
        children: <Widget>[
          Image.asset(
            imgUrl,
            width: ScreenUtil().setWidth(75),
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "$text",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(45)),
            ),
          )
        ],
      ),
    );
  }
}

///item
class MemberItem extends StatelessWidget {
  String title;
  String subTitle;

  MemberItem(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(143),
      margin: EdgeInsets.only(left: 20, right: 10),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.5, color: ThemeColors.colorGrey_10))),
      child: InkWell(
        onTap: () {
          print("点击了我的页面Item$title");
        },
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              height: ScreenUtil().setHeight(140),
              width: ScreenUtil().setWidth(310),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(45),
                    color: ThemeColors.colorBlack),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: ScreenUtil().setWidth(620),
              height: ScreenUtil().setHeight(140),
              padding: EdgeInsets.only(right: 10),
              child: Text(
                subTitle,
                textAlign: TextAlign.end,
              ),
            ),
            Image.asset(
              "images/appwidget_next_btn_default.png",
              width: ScreenUtil().setWidth(70),
            ),
          ],
        ),
      ),
    );
  }
}

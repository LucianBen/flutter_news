import 'package:flutter/material.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsAppBarHeight extends PreferredSize {
  Widget childView;
  @override
  final Size preferredSize;

  NewsAppBarHeight({this.childView, this.preferredSize});

  @override
  Widget build(BuildContext context) {
    Widget view = childView;
    if (childView == null) {
      view = LimitedBox(
          maxWidth: 0.0,
          maxHeight: 0.0,
          child: ConstrainedBox(constraints: const BoxConstraints.expand()));
    }
    return view;
  }
}

class NewsAppbar extends StatelessWidget {
  var hintText = [];
  final VoidCallback findClick;
  final VoidCallback hintClick;
  var bottomView;

  NewsAppbar({this.hintText, this.hintClick, this.findClick, this.bottomView});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeColors.colorWhite,
      elevation: 2.0,
      actions: <Widget>[
        Image.asset(
          "images/news_tab_top_logo.png",
          width: ScreenUtil().setWidth(300),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 10),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
              color: ThemeColors.colorGrey,
              borderRadius: BorderRadius.circular(60)),
          child: Row(
            children: <Widget>[
              Image.asset("images/icon_news_search.png", width: 20, height: 20),
              InkWell(
                onTap: hintClick,
                child: Text(
                  "   ${hintText.length < 1 ? "" : hintText[0]}",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ThemeColors.colorGrey_1,
                      fontSize: ScreenUtil().setSp(40)),
                ),
              )
            ],
          )

          /*TextField(
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: ThemeColors.colorGrey,
              prefix: Image.asset("images/icon_news_search.png",
                  width: 20, height: 20),
              hintText: hintText[0],
            ),
            onTap: () {
              print("点击输入框");
            },
          )*/
          ,
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(3),
          child: InkResponse(
            onTap: this.findClick,
            radius: 0.0,
            highlightColor: Colors.transparent,
            child: Image.asset(
              "images/icon_find.png",
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setHeight(80),
            ),
          ),
        )
      ],
      bottom: bottomView,
    );
  }
}

class SquareAppbar extends StatelessWidget {
  var hintText = [];
  final VoidCallback hintClick;

  SquareAppbar({this.hintText, this.hintClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: ThemeColors.colorGrey_1, width: 0.5))),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 7),
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        width: ScreenUtil().setWidth(1080),
        decoration: BoxDecoration(
            color: ThemeColors.colorGrey,
            borderRadius: BorderRadius.circular(60)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/icon_news_search.png", width: 20, height: 20),
            InkWell(
              onTap: hintClick,
              child: Text(
                "   ${hintText[0]}",
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ThemeColors.colorGrey_1,
                    fontSize: ScreenUtil().setSp(40)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

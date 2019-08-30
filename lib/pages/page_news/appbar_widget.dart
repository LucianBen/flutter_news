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
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );
    }
    return view;
  }
}

class NewsAppbar extends StatelessWidget {
  var hintText = [];
  final VoidCallback findClick;
  final VoidCallback hintClick;
//  List<Widget> tabs = [
//    Tab(text: "头条"),
//    Tab(text: "视频"),
//    Tab(text: "财经"),
//    Tab(text: "娱乐"),
//    Tab(text: "美食"),
//    Tab(text: "科技"),
//    Tab(text: "5G"),
//    Tab(text: "小说"),
//  ];

  NewsAppbar({this.hintText, this.hintClick, this.findClick});

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
                  "   ${hintText[0]}",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ThemeColors.colorGrey_1,
                      fontSize: ScreenUtil().setSp(50)),
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

    );
  }
}

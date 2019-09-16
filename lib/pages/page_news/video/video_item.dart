import 'package:flutter/material.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(700),
      child: Column(
        children: <Widget>[
          VideoLayout(),
          VideoAuthorComment(),
        ],
      ),
    );
  }
}

class VideoLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(550),
        child: Stack(
          children: <Widget>[
            Image.network(
              "http://p1.pstatp.com/large/pgc-image/RbqK2G57m1aP7m",
              width: ScreenUtil().setWidth(1080),
              height: ScreenUtil().setHeight(550),
              fit: BoxFit.fill,
            ),
            Positioned(
                left: 10,
                top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "title",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(50),
                          color: ThemeColors.colorWhite),
                    ),
                    Text(
                      "subtitle",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(40),
                          color: ThemeColors.colorWhite),
                    )
                  ],
                )),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: ThemeColors.colorGrey_2,
                    borderRadius: BorderRadius.circular(180)),
                child: Image.asset("images/tag_video_item_play.png"),
              ),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: ThemeColors.colorGrey_2,
                  ),
                  child: Text(
                    "18:00",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(35),
                        color: ThemeColors.colorWhite),
                  ),
                ))
          ],
        ));
  }
}

///未播放时布局
class VideoAuthorComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      padding: EdgeInsets.fromLTRB(10, 5, 10, 8),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(520),
            child: InkWell(
              onTap: () {},
              child: Row(children: <Widget>[
                ClipOval(
                  child: Image.network(
                      "https://upload.jianshu.io/users/upload_avatars/490111/0a24ad889a87.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/90/h/90/format/webp",
                      height: ScreenUtil().setHeight(80),
                      width: ScreenUtil().setWidth(80),
                      fit: BoxFit.cover),
                ),
                Text("  Author"),
              ]),
            ),
          ),
//          Container(width: ScreenUtil().setWidth(350)),
          Container(
            width: ScreenUtil().setWidth(200),
            child: InkWell(
              onTap: () {},
              child: Row(children: <Widget>[
                Image.asset("images/tag_video_support_unclick.png"),
                Text("  1.2万"),
              ]),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(200),
            child: InkWell(
              onTap: () {},
              child: Row(children: <Widget>[
                Image.asset("images/tag_video_list_comment.png"),
                Text("  16"),
              ]),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(100),
            child: InkWell(
              onTap: () {},
              child: Image.asset("images/tag_video_list_more_tools.png"),
            ),
          )
        ],
      ),
    );
  }
}

///播放时布局
class VideoPlayingAuthorComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 8, 10, 15),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_news/model/NewsVideoModel.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoItem extends StatelessWidget {
  final NewsVideoModel newsVideoItem;

  VideoItem(this.newsVideoItem); //视频

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(700),
      child: Column(
        children: <Widget>[
          _videoLayout(),
          _VideoAuthorComment(),
        ],
      ),
    );
  }

  ///视频布局
  Widget _videoLayout() {
    return Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(550),
        child: Stack(
          children: <Widget>[
            Image.network(
              newsVideoItem.thumbnail,
              width: ScreenUtil().setWidth(1080),
              height: ScreenUtil().setHeight(550),
              fit: BoxFit.fill,
            ),
            Positioned(
                left: 10,
                top: 10,
                width: ScreenUtil().setWidth(1040),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      newsVideoItem.title,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(45),
                          color: ThemeColors.colorWhite),
                    ),
                    Text(
                      int.parse(newsVideoItem.phvideo.playTime) / 10000 < 1
                          ? "${newsVideoItem.phvideo.playTime}次播放"
                          : "${(int.parse(newsVideoItem.phvideo.playTime) / 10000).toStringAsFixed(1)}万次播放",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(35),
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
                    newsVideoItem.phvideo.playTime,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(40),
                        color: ThemeColors.colorWhite),
                  ),
                ))
          ],
        ));
  }

  ///未播放时布局
  Widget _VideoAuthorComment() {
    return Container(
      width: ScreenUtil().setWidth(1080),
      padding: EdgeInsets.fromLTRB(10, 5, 10, 8),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(560),
            child: InkWell(
              onTap: () {},
              child: Row(children: <Widget>[
                ClipOval(
                  child: Image.network(newsVideoItem.subscribe.logo,
                      height: ScreenUtil().setHeight(80),
                      width: ScreenUtil().setWidth(80),
                      fit: BoxFit.cover),
                ),
                Text("   ${newsVideoItem.subscribe.catename}"),
              ]),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(200),
            child: InkWell(
              onTap: () {},
              child: Row(children: <Widget>[
                Image.asset("images/tag_video_support_unclick.png"),
                Text(int.parse(newsVideoItem.phvideo.praise) / 10000 < 1
                    ? "  ${newsVideoItem.phvideo.praise}"
                    : "  ${(int.parse(newsVideoItem.phvideo.praise) / 10000).toStringAsFixed(1)}万"),
              ]),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(160),
            child: InkWell(
              onTap: () {},
              child: Row(children: <Widget>[
                Image.asset("images/tag_video_list_comment.png"),
                Text(int.parse(newsVideoItem.commentsall) / 10000 < 1
                    ? "  ${newsVideoItem.commentsall}"
                    : "  ${(int.parse(newsVideoItem.commentsall) / 10000).toStringAsFixed(1)}万"),
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

  ///播放时布局
  Widget _VideoPlayingAuthorComment() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 8, 10, 15),
    );
  }
}

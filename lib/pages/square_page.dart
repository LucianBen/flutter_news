import 'package:flutter/material.dart';
import 'package:flutter_news/pages/page_news/appbar_widget.dart';

class SquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsAppBarHeight(
        preferredSize: Size.fromHeight(50),
        childView: SquareAppbar(
          hintText: ['微信内存不够啦'],
          hintClick: () {
            print("点击了广场搜索框");
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          squareIcon(),
          squareHot(),
          squareHour(),
          squareSpotlight(),
          squareAudiobook(),
          squareBoutique(),
          squareVideo()
        ],
      ),
    );
  }

  //广场-导航
  Widget squareIcon() {
    return Container();
  }

  //广场-热议
  Widget squareHot() {
    return Container();
  }

  //广场-24小时
  Widget squareHour() {
    return Container();
  }

  //广场-热点聚焦
  Widget squareSpotlight() {
    return Container();
  }

  //广场-精品有声书
  Widget squareAudiobook() {
    return Container();
  }

  //广场-原创精品
  Widget squareBoutique() {
    return Container();
  }

  //广场-精选视频
  Widget squareVideo() {
    return Container();
  }
}

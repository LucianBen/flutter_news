import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/model/news_nav_model.dart';
import 'package:flutter_news/model/square_hotword_model.dart';
import 'package:flutter_news/model/square_typelist_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//广场-导航
Widget squareNav(List<NewsNavModel> navList) {
  return Container();
}

//广场-热议
Widget squareHot(SquareHotwordModel hotList) {
  return Container(
    width: ScreenUtil().setWidth(1080),
    height: ScreenUtil().setHeight(900),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network(
              hotList.chConfig.titleIcon,
              fit: BoxFit.cover,
              width: ScreenUtil().setWidth(60),
            ),
            Text(hotList.chConfig.desc)
          ],
        ),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
//          mainAxisSpacing: 2,// 竖向间距
          crossAxisSpacing: 10,// 横向间距
          primary: false,
          padding: const EdgeInsets.all(2.0),
          childAspectRatio: 5.0,
          children: List.generate(hotList.item.length, (index) {
            return _textImage(
                hotList.item[index].title, hotList.item[index].titleIcon);
          }),
        )
      ],
    ),
  );
}

Widget _textImage(String data, String src) {
  return Container(
    height: ScreenUtil().setHeight(20),
    width: ScreenUtil().setWidth(100),
    child: Row(
      children: <Widget>[
        Text(data),
        Image.network(
          src,
          fit: BoxFit.cover,
          width: ScreenUtil().setWidth(60),
        ),
      ],
    ),
  );
}

//广场-24小时
Widget squareHour(SquareTypeListModel hourList) {
  return Container();
}

//广场-热点聚焦
Widget squareSpotlight(SquareTypeListModel hotspotList) {
  return Container();
}

//广场-精品有声书
Widget squareAudiobook(SquareTypeListModel readList) {
  return Container();
}

//广场-原创精品
Widget squareBoutique(SquareTypeListModel boutiqueList) {
  return Container();
}

//广场-精选视频
Widget squareVideo(List<NewsListModel> videoList) {
  return Container();
}

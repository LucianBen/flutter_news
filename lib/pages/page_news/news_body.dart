import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class NewsHeadline extends StatelessWidget {
  final List imageList;

  NewsHeadline(this.imageList);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRequset("newsHeadlines",
          id: "SYLB10,SYDT10", action: "down", pullNum: "1"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data1 = json.decode(snapshot.data[1].toString());
//          var data2 = json.decode(snapshot.data[1].toString());
          var data = "";
        }

        return ListView(
          children: <Widget>[
            NewsSwiper(imageList),
            NewsContext(),
          ],
        );
      },
    );
  }
}

class NewsSwiper extends StatelessWidget {
  final List imageList;

  NewsSwiper(this.imageList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(500),
      child: Swiper(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        autoplay: true,
        viewportFraction: 0.8,
        // 当前视窗展示比例 小于1可见上一个和下一个视窗
        scale: 0.8,
        // 两张图片之间的间隔
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(imageList[index]), fit: BoxFit.fill)),
          );
        },
        onTap: (index) {
          print("news_body/${index}");
        },
      ),
    );
  }
}

class NewsContext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

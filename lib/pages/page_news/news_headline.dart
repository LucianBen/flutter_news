import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//新闻-头条
class NewsHeadline extends StatelessWidget {
  List swiperImages = [
    "https://d.ifengimg.com/w230_h152_q100_aix16_aiy0_aiw614_aih407_webp/x0.ifengimg.com/res/2019/3D6F15F00862AB47AA73F1E3315DD4EF596BCCC1_size51_w640_h407.jpeg.webp",
    "https://d.ifengimg.com/w230_h152_q100_aix89_aiy0_aiw1360_aih900_webp/x0.ifengimg.com/res/2019/C592DD4AD733230C237F312FCFFF08C659CA9C68_size219_w1600_h900.jpeg.webp"
  ];

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return FutureBuilder(
      future: getRequset("newsHeadlines",
          id: "SYLB10,SYDT10", action: "down", pullNum: "1"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = json.decode(snapshot.data.toString());
          List<Map> topItems = (data[0]['item'] as List).cast(); //
          List<Map> newsItems = (data[1]['item'] as List).cast(); //

          return Column(
            children: <Widget>[
              NewsHeadlineSwiper(swiperImages),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                controller: scrollController,
                itemCount: topItems.length,
                itemBuilder: (context, index) {
                  return NewsHeadlineTop(topItems, index);
                },
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                controller: scrollController,
                itemCount: newsItems.length,
                itemBuilder: (context, index) {
                  return NewsHeadlineItems(newsItems, index);
                },
              ),
            ],
          );
        } else {
          return Text("暂无数据");
        }
      },
    );
  }
}

/// 新闻-头条-轮播图
class NewsHeadlineSwiper extends StatelessWidget {
  final List imageList;

  NewsHeadlineSwiper(this.imageList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(500),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Swiper(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        autoplay: true,
        viewportFraction: 0.8,
        // 当前视窗展示比例 小于1可见上一个和下一个视窗
        scale: 0.9,
        // 两张图片之间的间隔
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(2),
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

/// 新闻-头条-置顶
class NewsHeadlineTop extends StatelessWidget {
  final List<Map> topList;
  final int index;

  NewsHeadlineTop(this.topList, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1),
      height: ScreenUtil().setHeight(200),
      width: ScreenUtil().setWidth(1080),
      padding: EdgeInsets.all(10),
      color: ThemeColors.colorWhite,
      child: InkWell(
          onTap: () {
            print(topList[index]['link']['url']);
          },
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  topList[index]['title'],
                  style: TextStyle(
                      color: ThemeColors.colorBlack,
                      fontSize: ScreenUtil().setSp(40)),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "置顶",
                    style: TextStyle(
                        color: ThemeColors.colorRed,
                        fontSize: ScreenUtil().setSp(30)),
                  ),
                  Text(
                    "    ${topList[index]['source'] == null ? "" : topList[index]['source']}",
                    style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                  ),
                  Text(
                    "    ${topList[index]['commentsall']}评",
                    style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                  )
                ],
              )
            ],
          )),
    );
  }
}

/// 新闻-头条-内容
class NewsHeadlineItems extends StatelessWidget {
  final List<Map> itemList;
  final int index;

  NewsHeadlineItems(this.itemList, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1),
      height: ScreenUtil().setHeight(200),
      width: ScreenUtil().setWidth(1080),
      padding: EdgeInsets.all(10),
      color: ThemeColors.colorWhite,
      child: InkWell(
        onTap: () {},
        child: Container(),
      ),
    );
  }
}

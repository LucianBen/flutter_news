import 'package:flutter/material.dart';
import 'package:flutter_news/utils/ThemeColors.dart';

import 'page_news/appbar_widget.dart';
import 'page_news/news_body.dart';

class NewsPage extends StatelessWidget {
  var searchContext = ["tou偷摸123", '889'];
  List<Widget> tabList = [
    Tab(text: "头条"),
    Tab(text: "视频"),
    Tab(text: "财经"),
    Tab(text: "娱乐"),
    Tab(text: "美食"),
    Tab(text: "科技"),
    Tab(text: "5G"),
    Tab(text: "小说"),
  ];

  List swiperImages = [
    "https://d.ifengimg.com/w230_h152_q100_aix16_aiy0_aiw614_aih407_webp/x0.ifengimg.com/res/2019/3D6F15F00862AB47AA73F1E3315DD4EF596BCCC1_size51_w640_h407.jpeg.webp",
    "https://d.ifengimg.com/w230_h152_q100_aix89_aiy0_aiw1360_aih900_webp/x0.ifengimg.com/res/2019/C592DD4AD733230C237F312FCFFF08C659CA9C68_size219_w1600_h900.jpeg.webp"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        appBar: NewsAppBarHeight(
          preferredSize: Size.fromHeight(90),
          childView: NewsAppbar(
            hintText: searchContext,
            hintClick: () {
              print("点击了搜索");
            },
            findClick: () {
              print("点击了发现");
            },
            bottomView: TabBar(
              isScrollable: true,
              tabs: tabList,
              indicatorColor: ThemeColors.colorTheme,
              indicatorPadding: EdgeInsets.only(left: 20, right: 20),
              labelColor: ThemeColors.colorTheme,
              unselectedLabelColor: ThemeColors.colorGrey_1,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            NewsHeadline(swiperImages),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}

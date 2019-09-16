import 'package:flutter/material.dart';
import 'package:flutter_news/utils/ThemeColors.dart';

import 'page_news/appbar_widget.dart';
import 'page_news/news_headline.dart';

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        appBar: NewsAppBarHeight(
          preferredSize: Size.fromHeight(90),
          childView: _Appbar(),
        ),
        body: TabBarView(
          children: [
            NewsHeadline(),
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

  //自定义AppBar
  Widget _Appbar() {
    return NewsAppbar(
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
    );
  }
}

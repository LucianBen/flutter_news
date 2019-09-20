import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_search_model.dart';
import 'package:flutter_news/pages/page_news/5g/news_5g.dart';
import 'package:flutter_news/pages/page_news/food/news_food.dart';
import 'package:flutter_news/pages/page_news/technology/news_technology.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_news/utils/http.dart';

import 'page_news/appbar_widget.dart';
import 'page_news/entertainment/news_entertainment.dart';
import 'page_news/finance/news_finance.dart';
import 'page_news/headline/news_headline.dart';
import 'page_news/novel/news_novel.dart';
import 'page_news/video/news_video.dart';

class NewsPage extends StatelessWidget {
  List newsSearchItems = [];
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
    return FutureBuilder(
        future: getRequset("newsSearch", pullNum: 0),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List data = json.decode(snapshot.data.toString());
            newsSearchItems =
                data.map((i) => NewsSearchModel.fromJson(i).item).toList(); //抽取新闻搜索框列表为List

          }
          return DefaultTabController(
              length: tabList.length,
              child: Scaffold(
                appBar: NewsAppBarHeight(
                  preferredSize: Size.fromHeight(90),
                  childView: _Appbar(context),
                ),
                body: TabBarView(
                  children: [
                    NewsHeadline(),
                    NewsVideo(),
                    NewsFinance(),
                    NewsEntertainment(),
                    NewsFood(),
                    NewsTechnology(),
                    Gg(),
                    NewsNovel(),
                  ],
                ),
              ));
        });
  }

  //自定义AppBar
  Widget _Appbar(BuildContext context) {
    return NewsAppbar(
      hintText: newsSearchItems,
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_news/model/news_entertainmentNav_model.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/provider/news_entertainment_provider.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:provider/provider.dart';

import '../../no_data.dart';
import '../news_data.dart';
import '../news_item.dart';
import '../news_item_content_type.dart';
import 'entertainment_item.dart';

///新闻-娱乐
class NewsEntertainment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NetArchitecture();
  }

  Widget NetArchitecture() {
    return FutureBuilder(
      future: getRequset("newsEntertainment",
          id: "YL53,FOCUSYL53,SECNAVYL53", action: "default"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List dataNewsList = json.decode(snapshot.data.toString())[0]['item'];
          List dataNewsSwiperList =
              json.decode(snapshot.data.toString())[1]['item'];
          List dataEntertainmentNav =
              json.decode(snapshot.data.toString())[2]['item'];
          return Consumer<NewsEntertainmentProvider>(builder: (context,
              NewsEntertainmentProvider newsEntertainmentProvider, _) {
            if (newsEntertainmentProvider.newsEntertainmentListItem.length <=
                0) {
              //娱乐新闻列表
              newsEntertainmentProvider.newsEntertainmentListItem =
                  dataNewsList.map((i) => NewsListModel.fromJson(i)).toList();
              //娱乐新闻导航栏
              newsEntertainmentProvider.newsEntertainmentNavItem =
                  dataEntertainmentNav
                      .map((i) => NewsEntertainmentNavModel.fromJson(i))
                      .toList();
              //娱乐新闻Swiper
              newsEntertainmentProvider.newsEntertainmentSwiperListItem =
                  dataNewsSwiperList
                      .map((i) => NewsListModel.fromJson(i))
                      .toList();
            }

            return NetRefreshLoad(newsEntertainmentProvider);
          });
        } else {
          return Nodata();
        }
      },
    );
  }

  Widget NetRefreshLoad(NewsEntertainmentProvider newsEntertainmentProvider) {
    return EasyRefresh(
        header: ClassicalHeader(
            bgColor: Colors.white,
            textColor: Colors.pink,
            infoColor: Colors.pink,
            infoText: '上次更新时间：%T',
            refreshText: '下拉刷新',
            refreshedText: '刷新中...',
            refreshReadyText: '放开即刷新'),
        footer: ClassicalFooter(
          bgColor: Colors.white,
          textColor: Colors.pink,
          infoColor: Colors.pink,
          loadedText: '上拉加载',
          noMoreText: '',
          infoText: '加载中...',
        ),
        onLoad: () async {
          getNewsEntertainment(true, newsEntertainmentProvider);
        },
        onRefresh: () async {
          getNewsEntertainment(false, newsEntertainmentProvider);
        },
        child: NewsFinanceBody(newsEntertainmentProvider));
  }

  Widget NewsFinanceBody(NewsEntertainmentProvider newsEntertainmentProvider) {
    if (newsEntertainmentProvider.newsEntertainmentSwiperListItem.length <= 0) {
      return ListView(
        children: <Widget>[
          EntertainmentNav(newsEntertainmentProvider.newsEntertainmentNavItem),
          NewsList(newsEntertainmentProvider.newsEntertainmentListItem)
        ],
      );
    } else {
      List imageList = [];
      List urlList = [];
      List titleList = [];
      newsEntertainmentProvider.newsEntertainmentSwiperListItem.forEach((f) {
        if (f.type != "advert") {
          imageList.add(f.thumbnail);
          urlList.add(f.link.url);
          titleList.add(f.title);
        }
      });
      return ListView(
        children: <Widget>[
          NewsSwiper(imageList, titleList, urlList),
          EntertainmentNav(newsEntertainmentProvider.newsEntertainmentNavItem),
          NewsList(newsEntertainmentProvider.newsEntertainmentListItem)
        ],
      );
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_news/model/news_5G_model.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/provider/news_5G_provider.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:provider/provider.dart';

import '../../no_data.dart';
import '../news_data.dart';
import '../news_item.dart';
import '../news_item_content_type.dart';

class Gg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NetArchitecture();
  }

  Widget NetArchitecture() {
    return FutureBuilder(
      future: getRequset("newsEntertainment", id: "KJ5G,FOCUSKJ5G"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List dataNewsList = json.decode(snapshot.data.toString())[0]['item'];
          List dataEntertainmentNav =
              json.decode(snapshot.data.toString())[1]['item'];
          return Consumer<News5GProvider>(
              builder: (context, News5GProvider news5GProvider, _) {
            if (news5GProvider.news5GListItem.length <= 0) {
              news5GProvider.news5GListItem =
                  dataNewsList.map((i) => NewsListModel.fromJson(i)).toList();
              news5GProvider.news5GViewpager = dataEntertainmentNav
                  .map((i) => News5GModel.fromJson(i))
                  .toList();
            }

            return NetRefreshLoad(news5GProvider);
          });
        } else {
          return Nodata();
        }
      },
    );
  }

  Widget NetRefreshLoad(News5GProvider news5GProvider) {
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
          getNews5G(true, news5GProvider);
        },
        onRefresh: () async {
          getNews5G(false, news5GProvider);
        },
        child: _news5GBody(news5GProvider));
  }

  Widget _news5GBody(News5GProvider news5GProvider) {
    if (news5GProvider.news5GViewpager.length <= 0) {
      return NewsList(
        news5GProvider.news5GListItem,
        isAllSingleImage: true,
      );
    } else {
      news5GProvider.news5GViewpager.forEach((f) => {
            news5GProvider.images.add(f.thumbnail),
            news5GProvider.titles.add(f.title),
            news5GProvider.urls.add(f.link.url)
          });
      return ListView(
        children: <Widget>[
          NewsSwiper(news5GProvider.images, news5GProvider.titles,
              news5GProvider.urls),
          NewsList(
            news5GProvider.news5GListItem,
            isAllSingleImage: true,
          )
        ],
      );
    }
  }
}

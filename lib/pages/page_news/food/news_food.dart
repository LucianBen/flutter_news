import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/provider/news_food_provider.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:provider/provider.dart';

import '../../no_data.dart';
import '../news_data.dart';
import '../news_item.dart';
import '../news_item_content_type.dart';

///新闻-美食
class NewsFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NetArchitecture();
  }

  Widget NetArchitecture() {
    return FutureBuilder(
      future: getRequset("newsFood", id: "DELIC,FOCUSDELIC", action: "default"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List dataNewsList = json.decode(snapshot.data.toString())[0]['item'];
          List dataNewsSwiperList =
              json.decode(snapshot.data.toString())[1]['item'];

          return Consumer<NewsFoodProvider>(
              builder: (context, NewsFoodProvider newsFoodProvider, _) {
            if (newsFoodProvider.newsFoodListItem.length <= 0) {
              //美食新闻列表
              newsFoodProvider.newsFoodListItem =
                  dataNewsList.map((i) => NewsListModel.fromJson(i)).toList();
              //美食新闻Swiper
              newsFoodProvider.newsFoodSwiperListItem = dataNewsSwiperList
                  .map((i) => NewsListModel.fromJson(i))
                  .toList();
            }

            return NetRefreshLoad(newsFoodProvider);
          });
        } else {
          return Nodata();
        }
      },
    );
  }

  Widget NetRefreshLoad(NewsFoodProvider newsFoodProvider) {
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
          getNewsFood(true, newsFoodProvider);
        },
        onRefresh: () async {
          getNewsFood(false, newsFoodProvider);
        },
        child: _newsFoodBody(newsFoodProvider));
  }

  Widget _newsFoodBody(NewsFoodProvider newsFoodProvider) {
    if (newsFoodProvider.newsFoodSwiperListItem.length <= 0) {
      return NewsList(newsFoodProvider.newsFoodListItem);
    } else {
      List imageList = [];
      List urlList = [];
      List titleList = [];
      newsFoodProvider.newsFoodSwiperListItem.forEach((f) {
        if (f.type != "advert") {
          imageList.add(f.thumbnail);
          urlList.add(f.link.url);
          titleList.add(f.title);
        }
      });
      return ListView(
        children: <Widget>[
          NewsSwiper(imageList, titleList, urlList),
          NewsList(newsFoodProvider.newsFoodListItem)
        ],
      );
    }
  }
}

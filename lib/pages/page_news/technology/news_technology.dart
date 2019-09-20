import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/model/news_nav_model.dart';
import 'package:flutter_news/provider/news_technology_provider.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:provider/provider.dart';

import '../../no_data.dart';
import '../news_data.dart';
import '../news_item.dart';
import '../news_item_content_type.dart';
import 'technology_item.dart';

///新闻-科技
class NewsTechnology extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _netArchitecture();
  }

  Widget _netArchitecture() {
    return FutureBuilder(
      future: getRequset("newsItems",
          id: "KJ123,FOCUSKJ123,SECNAVKJ123", action: "default"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List dataNewsList = json.decode(snapshot.data.toString())[0]['item'];
          List dataNewsSwiperList =
          json.decode(snapshot.data.toString())[1]['item'];
          List dataTechnologyNav =
          json.decode(snapshot.data.toString())[2]['item'];
          return Consumer<NewsTechnologyProvider>(builder: (context,
              NewsTechnologyProvider newsTechnologyProvider, _) {
            if (newsTechnologyProvider.newsTechnologyListItem.length <=
                0) {
              //科技新闻列表
              newsTechnologyProvider.newsTechnologyListItem =
                  dataNewsList.map((i) => NewsListModel.fromJson(i)).toList();
              //科技新闻导航栏
              newsTechnologyProvider.newsTechnologyNavItem =
                  dataTechnologyNav
                      .map((i) => NewsNavModel.fromJson(i))
                      .toList();
              //科技新闻Swiper
              newsTechnologyProvider.newsTechnologySwiperListItem =
                  dataNewsSwiperList
                      .map((i) => NewsListModel.fromJson(i))
                      .toList();
            }

            return _netRefreshLoad(newsTechnologyProvider);
          });
        } else {
          return Nodata();
        }
      },
    );
  }

  Widget _netRefreshLoad(NewsTechnologyProvider newsTechnologyProvider) {
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
          getNewsTechnology(true, newsTechnologyProvider);
        },
        onRefresh: () async {
          getNewsTechnology(false, newsTechnologyProvider);
        },
        child: _newsTechnologyBody(newsTechnologyProvider));
  }

  Widget _newsTechnologyBody(NewsTechnologyProvider newsTechnologyProvider) {
    if (newsTechnologyProvider.newsTechnologySwiperListItem.length <= 0) {
      return ListView(
        children: <Widget>[
          TechnologyNav(newsTechnologyProvider.newsTechnologyNavItem),
          NewsList(newsTechnologyProvider.newsTechnologyListItem)
        ],
      );
    } else {
      List imageList = [];
      List urlList = [];
      List titleList = [];
      newsTechnologyProvider.newsTechnologySwiperListItem.forEach((f) {
        if (f.type != "advert") {
          imageList.add(f.thumbnail);
          urlList.add(f.link.url);
          titleList.add(f.title);
        }
      });
      return ListView(
        children: <Widget>[
          NewsSwiper(imageList, titleList, urlList),
          TechnologyNav(newsTechnologyProvider.newsTechnologyNavItem),
          NewsList(newsTechnologyProvider.newsTechnologyListItem)
        ],
      );
    }
  }


}

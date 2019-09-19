import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_news/model/news_video_model.dart';
import 'package:flutter_news/pages/page_news/news_data.dart';
import 'package:flutter_news/provider/news_video_provider.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:provider/provider.dart';

import '../../no_data.dart';
import 'video_item.dart';

///新闻-视频
class NewsVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NetArchitecture();
  }

  Widget NetArchitecture() => FutureBuilder(
        future: getRequset("newsVideo", id: "RECOMVIDEO", action: "default"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List data = json.decode(snapshot.data.toString())[0]['item'];
            return Consumer<NewsVideoProvider>(
                builder: (context, NewsVideoProvider newsVideoProvider, _) {
              if (newsVideoProvider.newsVideoItem.length <= 0) {
                newsVideoProvider.newsVideoItem =
                    data.map((i) => NewsVideoModel.fromJson(i)).toList();
              }

              return NetRefreshLoad(newsVideoProvider);
            });
          } else {
            return Nodata();
          }
        },
      );

  Widget NetRefreshLoad(NewsVideoProvider newsVideoProvider) {
    return EasyRefresh(
        header: ClassicalHeader(
            bgColor: Colors.pink,
            textColor: Colors.white,
            infoColor: Colors.white,
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
          getNewsVideo(true, newsVideoProvider);
        },
        onRefresh: () async {
          getNewsVideo(false, newsVideoProvider);
        },
        child: NewsVideoBody(newsVideoProvider));
  }

  Widget NewsVideoBody(NewsVideoProvider newsVideoProvider) {
    return ListView.builder(
        itemCount: newsVideoProvider.newsVideoItem.length,
        itemBuilder: (context, index) {
          if (newsVideoProvider.newsVideoItem[index].showType == null) {
            return Container();
          }
          return VideoItem(newsVideoProvider.newsVideoItem[index]);
        });
  }
}

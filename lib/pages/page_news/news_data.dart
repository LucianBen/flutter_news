import 'dart:convert';

import 'package:flutter_news/model/NewsVideoModel.dart';
import 'package:flutter_news/provider/news_headlines_provider.dart';
import 'package:flutter_news/provider/news_video_provider.dart';
import 'package:flutter_news/utils/http.dart';

/*  头条  */
getNewHeadlines(
    bool isLoad, NewsHeadlinesProvider newsHeadlinesProvider) async {
  if (isLoad) {
    newsHeadlinesProvider.addPage(); //如果是加载，则页数加1
  } else {
    newsHeadlinesProvider.page = 1;
  }
  await getRequset("newsHeadlines",
          id: "SYLB10,SYDT10",
          action: "down",
          pullNum: newsHeadlinesProvider.page)
      .then((val) {
    if (val != null) {
      var data = json.decode(val.toString());
      List<Map> topItems = (data[0]['item'] as List).cast(); //置顶新闻
      List<Map> newsItems = (data[1]['item'] as List).cast(); //热点新闻
      if (isLoad) {
        newsHeadlinesProvider.getLoadData(topItems, newsItems);
      } else {
        newsHeadlinesProvider.getRefreshData(topItems, newsItems);
      }
    }
  });
}

/*  视频  */
getNewsVideo(bool isLoad, NewsVideoProvider newsVideoProvider) async {
  if (isLoad) {
    newsVideoProvider.addPage(); //如果是加载，则页数加1
  } else {
    newsVideoProvider.page = 1;
  }
  await getRequset("newsVideo",
          id: "RECOMVIDEO", action: "default", pullNum: newsVideoProvider.page)
      .then((val) {
    if (val != null) {
      var data = json.decode(val.toString());

      List<NewsVideoModel> newsVideoItems = (data[0]['item'] as List)
          .map((i) => NewsVideoModel.fromJson(i))
          .toList(); //视频新闻
      if (isLoad) {
        newsVideoProvider.getLoadVideoData(newsVideoItems);
      } else {
        newsVideoProvider.getRefreshVideoData(newsVideoItems);
      }
    }
  });
}

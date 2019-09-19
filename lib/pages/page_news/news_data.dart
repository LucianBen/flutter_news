import 'dart:convert';

import 'package:flutter_news/model/NewsEntertainmentNavModel.dart';
import 'package:flutter_news/model/news_finance_model.dart';
import 'package:flutter_news/model/NewsVideoModel.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/provider/news_entertainment_provider.dart';
import 'package:flutter_news/provider/news_finance_provider.dart';
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

/*  财经  */
getNewsFinance(bool isLoad, NewsFinanceProvider newsFinanceProvider) async {
  if (isLoad) {
    newsFinanceProvider.addPage(); //如果是加载，则页数加1
  } else {
    newsFinanceProvider.page = 1;
  }
  await getRequset("newsFinance",
          id: "CJ33,FOCUSCJ33",
          action: "down",
          pullNum: newsFinanceProvider.page)
      .then((val) {
    if (val != null) {
      var data = json.decode(val.toString());

      List<NewsFinanceLiveRoomModel> newsFinanceLiveRoomItems =
          (data[0]['item'] as List)
              .map((i) => NewsFinanceLiveRoomModel.fromJson(i))
              .toList(); //财经新闻直播室
      List<NewsListModel> newsFinanceItems = (data[1]['item'] as List)
          .map((i) => NewsListModel.fromJson(i))
          .toList(); //财经新闻列表
      if (isLoad) {
        newsFinanceProvider.getLoadFinanceData(
            newsFinanceLiveRoomItems, newsFinanceItems);
      } else {
        newsFinanceProvider.getRefreshFinanceData(
            newsFinanceLiveRoomItems, newsFinanceItems);
      }
    }
  });
}

/*  娱乐  */
getNewsEntertainment(
    bool isLoad, NewsEntertainmentProvider newsEntertainmentProvider) async {
  if (isLoad) {
    newsEntertainmentProvider.addPage(); //如果是加载，则页数加1
  } else {
    newsEntertainmentProvider.page = 1;
  }
  await getRequset("newsEntertainment",
          id: "YL53,FOCUSYL53,SECNAVYL53",
          action: "default",
          pullNum: newsEntertainmentProvider.page)
      .then((val) {
    if (val != null) {
      var data = json.decode(val.toString());

      List<NewsListModel> newsEntertainmentItems = (data[0]['item'] as List)
          .map((i) => NewsListModel.fromJson(i))
          .toList(); //娱乐新闻列表
      List<NewsEntertainmentNavModel> newsEntertainmentNavItems =
          (data[2]['item'] as List)
              .map((i) => NewsEntertainmentNavModel.fromJson(i))
              .toList(); //娱乐新闻导航栏
      if (isLoad) {
        newsEntertainmentProvider.getLoadEntertainmentData(
            newsEntertainmentNavItems, newsEntertainmentItems);
      } else {
        newsEntertainmentProvider.getRefreshEntertainmentData(
            newsEntertainmentNavItems, newsEntertainmentItems);
      }
    }
  });
}

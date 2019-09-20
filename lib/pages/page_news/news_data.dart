import 'dart:convert';

import 'package:flutter_news/model/news_5G_model.dart';
import 'package:flutter_news/model/news_finance_model.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/model/news_nav_model.dart';
import 'package:flutter_news/model/news_video_model.dart';
import 'package:flutter_news/provider/news_5G_provider.dart';
import 'package:flutter_news/provider/news_entertainment_provider.dart';
import 'package:flutter_news/provider/news_finance_provider.dart';
import 'package:flutter_news/provider/news_food_provider.dart';
import 'package:flutter_news/provider/news_headlines_provider.dart';
import 'package:flutter_news/provider/news_technology_provider.dart';
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
  await getRequset("newsItems",
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
  await getRequset("newsItems",
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
  await getRequset("newsItems",
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
  await getRequset("newsItems",
          id: "YL53,FOCUSYL53,SECNAVYL53",
          action: "default",
          pullNum: newsEntertainmentProvider.page)
      .then((val) {
    if (val != null) {
      var data = json.decode(val.toString());

      List<NewsListModel> newsEntertainmentItems = (data[0]['item'] as List)
          .map((i) => NewsListModel.fromJson(i))
          .toList(); //娱乐新闻列表
      /*移除数据中的前2条*/
      newsEntertainmentItems.removeRange(0, 2);
      List<NewsNavModel> newsEntertainmentNavItems = (data[2]['item'] as List)
          .map((i) => NewsNavModel.fromJson(i))
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

/*  美食  */
getNewsFood(bool isLoad, NewsFoodProvider newsFoodProvider) async {
  if (isLoad) {
    newsFoodProvider.addPage(); //如果是加载，则页数加1
  } else {
    newsFoodProvider.page = 1;
  }
  await getRequset("newsItems",
          id: "DELIC,FOCUSDELIC", pullNum: newsFoodProvider.page, action: "up")
      .then((val) {
    if (val != null) {
      List data = json.decode(val.toString());

      List<NewsListModel> newsFoodItems = (data[0]['item'] as List)
          .map((i) => NewsListModel.fromJson(i))
          .toList(); //美食新闻列表

      if (isLoad) {
        newsFoodProvider.getLoadFoodData(newsFoodItems);
      } else {
        newsFoodProvider.getRefreshFoodData(newsFoodItems);
      }
    }
  });
}

/*  科技  */
getNewsTechnology(
    bool isLoad, NewsTechnologyProvider newsTechnologyProvider) async {
  if (isLoad) {
    newsTechnologyProvider.addPage(); //如果是加载，则页数加1
  } else {
    newsTechnologyProvider.page = 1;
  }
  await getRequset("newsItems",
          id: "KJ123,FOCUSKJ123,SECNAVKJ123",
          action: "default",
          pullNum: newsTechnologyProvider.page)
      .then((val) {
    if (val != null) {
      var data = json.decode(val.toString());

      List<NewsListModel> newsTechnologyItems = (data[0]['item'] as List)
          .map((i) => NewsListModel.fromJson(i))
          .toList(); //科技新闻列表
      List<NewsNavModel> newsTechnologyNavItems = (data[2]['item'] as List)
          .map((i) => NewsNavModel.fromJson(i))
          .toList(); //科技新闻导航栏
      if (isLoad) {
        newsTechnologyProvider.getLoadTechnologyData(
            newsTechnologyNavItems, newsTechnologyItems);
      } else {
        newsTechnologyProvider.getRefreshTechnologyData(
            newsTechnologyNavItems, newsTechnologyItems);
      }
    }
  });
}

/*  5G  */
getNews5G(bool isLoad, News5GProvider news5GProvider) async {
  if (isLoad) {
    news5GProvider.addPage(); //如果是加载，则页数加1
  } else {
    news5GProvider.page = 1;
  }
  await getRequset("newsItems", id: "KJ5G,FOCUSKJ5G", page: news5GProvider.page)
      .then((val) {
    if (val != null) {
      List data = json.decode(val.toString());
      if (data.length <= 0) {
//        news5GProvider.getLoad5GData([]);
        return;
      }

      List<NewsListModel> news5GItems = (data[0]['item'] as List)
          .map((i) => NewsListModel.fromJson(i))
          .toList(); //5G新闻列表

      if (isLoad) {
        news5GProvider.getLoad5GData(news5GItems);
      } else {
        List<News5GModel> news5GViewpager = (data[1]['item'] as List)
            .map((i) => News5GModel.fromJson(i))
            .toList(); //5G新闻导航栏
        news5GProvider.getRefresh5GData(news5GViewpager, news5GItems);
      }
    }
  });
}

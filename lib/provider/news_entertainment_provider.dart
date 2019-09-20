import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_nav_model.dart';
import 'package:flutter_news/model/news_item_model.dart';

class NewsEntertainmentProvider with ChangeNotifier {
  int page = 1;

  addPage() {
    page++;
  }

  List<NewsNavModel> newsEntertainmentNavItem = []; //娱乐新闻导航
  List<NewsListModel> newsEntertainmentListItem = []; //娱乐新闻列表
  List<NewsListModel> newsEntertainmentSwiperListItem = []; //娱乐新闻Swiper

  void getLoadEntertainmentData(
      List<NewsNavModel> newsEntertainmentNavItemList,
      List<NewsListModel> newsEntertainmentItemList) {
    newsEntertainmentNavItem = newsEntertainmentNavItemList;
    newsEntertainmentListItem.addAll(newsEntertainmentItemList);
    notifyListeners();
  }

  void getRefreshEntertainmentData(
      List<NewsNavModel> newsEntertainmentNavItemList,
      List<NewsListModel> newsEntertainmentItemList) {
    newsEntertainmentNavItem = newsEntertainmentNavItemList;
    newsEntertainmentListItem = newsEntertainmentItemList;
    newsEntertainmentSwiperListItem = [];
    notifyListeners();
  }
}

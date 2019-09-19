import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_entertainmentNav_model.dart';
import 'package:flutter_news/model/news_item_model.dart';

class NewsEntertainmentProvider with ChangeNotifier {
  int page = 1;

  addPage() {
    page++;
  }

  List<NewsEntertainmentNavModel> newsEntertainmentNavItem = []; //娱乐新闻导航
  List<NewsListModel> newsEntertainmentListItem = []; //娱乐新闻列表

  void getLoadEntertainmentData(
      List<NewsEntertainmentNavModel> newsEntertainmentNavItemList,
      List<NewsListModel> newsEntertainmentItemList) {
    newsEntertainmentNavItem = newsEntertainmentNavItemList;
    newsEntertainmentListItem.addAll(newsEntertainmentItemList);
    notifyListeners();
  }

  void getRefreshEntertainmentData(
      List<NewsEntertainmentNavModel> newsEntertainmentNavItemList,
      List<NewsListModel> newsEntertainmentItemList) {
    newsEntertainmentNavItem = newsEntertainmentNavItemList;
    newsEntertainmentListItem = newsEntertainmentItemList;
    notifyListeners();
  }
}

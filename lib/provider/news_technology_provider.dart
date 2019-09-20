import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/model/news_nav_model.dart';

class NewsTechnologyProvider with ChangeNotifier {
  int page = 1;

  addPage() {
    page++;
  }

  List<NewsNavModel> newsTechnologyNavItem = []; //娱乐新闻导航
  List<NewsListModel> newsTechnologyListItem = []; //娱乐新闻列表
  List<NewsListModel> newsTechnologySwiperListItem = []; //娱乐新闻Swiper

  void getLoadTechnologyData(List<NewsNavModel> newsTechnologyNavItemList,
      List<NewsListModel> newsTechnologyItemList) {
    newsTechnologyNavItem = newsTechnologyNavItemList;
    newsTechnologyListItem.addAll(newsTechnologyItemList);
    notifyListeners();
  }

  void getRefreshTechnologyData(List<NewsNavModel> newsTechnologyNavItemList,
      List<NewsListModel> newsTechnologyItemList) {
    newsTechnologyNavItem = newsTechnologyNavItemList;
    newsTechnologyListItem = newsTechnologyItemList;
    newsTechnologySwiperListItem = [];
    notifyListeners();
  }
}

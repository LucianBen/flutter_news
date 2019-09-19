import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_5G_model.dart';
import 'package:flutter_news/model/news_item_model.dart';

class News5GProvider with ChangeNotifier {
  int page = 1;

  addPage() {
    page++;
  }

  List<News5GModel> news5GViewpager = []; //5G新闻viewpager
  List<NewsListModel> news5GListItem = []; //5G新闻列表

  void getLoad5GData(List<NewsListModel> news5GItemList) {
    news5GListItem.addAll(news5GItemList);
    notifyListeners();
  }

  void getRefresh5GData(List<News5GModel> news5GViewpagerItemList,
      List<NewsListModel> news5GItemList) {
    news5GViewpager = [];
    news5GListItem = news5GItemList;
    notifyListeners();
  }

  List images = [];
  List titles = [];
  List urls = [];
}

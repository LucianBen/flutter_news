import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_item_model.dart';

class NewsFoodProvider with ChangeNotifier {
  int page = 1;

  addPage() {
    page++;
  }

  List<NewsListModel> newsFoodListItem = []; //美食新闻列表
  List<NewsListModel> newsFoodSwiperListItem = []; //美食新闻Swiper

  void getLoadFoodData(List<NewsListModel> newsFoodItemList) {
    newsFoodListItem.addAll(newsFoodItemList);
    notifyListeners();
  }

  void getRefreshFoodData(
      List<NewsListModel> newsFoodItemList) {
    newsFoodListItem = newsFoodItemList;
    newsFoodSwiperListItem = [];
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class NewsProvider with ChangeNotifier {
  int page = 1;
  List<Map> topItems = []; //置顶新闻
  List<Map> newsItems = []; //热点新闻


  addPage() {
    page++;
  }

  getLoadData(List<Map> topItemList, List<Map> newNewsItemList) {
    topItems = topItemList;
    newsItems.addAll(newNewsItemList);
    notifyListeners();
  }

  getRefreshData(List<Map> topItemList, List<Map> newsItemList) {
    page = 1;
    topItems = topItemList;
    newsItems = newsItemList;
    notifyListeners();
  }
}

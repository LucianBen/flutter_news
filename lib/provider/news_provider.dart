import 'package:flutter/material.dart';

class NewsProvider with ChangeNotifier {
  int page = 1;
  List<Map> topItems = []; //置顶新闻
  List<Map> newsItems = []; //热点新闻

  addPage() {
    page++;
  }

  void getLoadData(List<Map> topItemList, List<Map> newNewsItemList) {
    newsItems.addAll(newNewsItemList);
    topItems = topItemList;
    notifyListeners();
  }

  void getRefreshData(List<Map> topItemList, List<Map> newsItemList) {
    topItems = topItemList;
    newsItems = newsItemList;
    notifyListeners();
  }
}

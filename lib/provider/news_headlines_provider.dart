import 'package:flutter/material.dart';

class NewsHeadlinesProvider with ChangeNotifier {
  int page = 1;
  List<Map> topItems = []; //头条 置顶新闻
  List<Map> newsItems = []; //头条 热点新闻

  addPage() {
    page++;
  }

  /*新闻-头条 加载数据 刷新数据*/
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

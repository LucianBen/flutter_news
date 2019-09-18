import 'package:flutter/material.dart';
import 'package:flutter_news/model/NewsFinanceModel.dart';

/*新闻-财经 加载数据 刷新数据*/
class NewsFinanceProvider with ChangeNotifier {
  int page = 1;

  addPage() {
    page++;
  }

  List<NewsFinanceLiveRoomModel> newsFinanceLiveRoomItem = []; //财经新闻直播室
  List<NewsListModel> newsFinanceListItem = []; //财经新闻列表

  void getLoadFinanceData(
      List<NewsFinanceLiveRoomModel> newsFinanceLiveRoomItemList,
      List<NewsListModel> newsFinanceItemList) {
    newsFinanceLiveRoomItem = newsFinanceLiveRoomItemList;
    newsFinanceListItem.addAll(newsFinanceItemList);
    notifyListeners();
  }

  void getRefreshFinanceData(
      List<NewsFinanceLiveRoomModel> newsFinanceLiveRoomItemList,
      List<NewsListModel> newsFinanceItemList) {
    newsFinanceLiveRoomItem = newsFinanceLiveRoomItemList;
    newsFinanceListItem = newsFinanceItemList;
    notifyListeners();
  }
}

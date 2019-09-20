import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/model/news_nav_model.dart';
import 'package:flutter_news/model/square_hotword_model.dart';
import 'package:flutter_news/model/square_typelist_model.dart';

class SquareProvider with ChangeNotifier {
  //广场-导航栏
  List<NewsNavModel> squareNav = [];

  //广场-热议
  SquareHotwordModel squareHotword;

  //广场-不同类型内容
  List<SquareTypeListModel> squareTypeList = [];

  //广场-视频内容
  List<NewsListModel> squareList = [];

  void getLoadSquareData(List<NewsListModel> squareItemList) {
    squareList = squareItemList;
    notifyListeners();
  }

  void getRefreshSquareData(
      List<SquareHotwordItem> squareHotwordItemList,
      List<SquareTypeListModel> squareTypeItemList,
      List<NewsListModel> squareItemList) {
    squareHotword.item = squareHotwordItemList;
    squareTypeList = squareTypeItemList;
    squareList = squareItemList;
    notifyListeners();
  }
}

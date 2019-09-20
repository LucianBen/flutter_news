import 'dart:convert';

import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/model/news_nav_model.dart';
import 'package:flutter_news/model/square_hotword_model.dart';
import 'package:flutter_news/model/square_typelist_model.dart';
import 'package:flutter_news/provider/square_provider.dart';
import 'package:flutter_news/utils/http.dart';

/*  娱乐  */
getSquare(bool isLoad, SquareProvider squareProvider) async {
  await getRequset("squareItems", action: "${isLoad ? "up" : "default"}")
      .then((val) {
    if (val != null) {
      var data = json.decode(val.toString());

      if (isLoad) {
        List<NewsListModel> squareItems =
            data[0]['item'].map((i) => NewsListModel.fromJson(i)).toList();
        squareProvider.getLoadSquareData(squareItems);
      } else {
        List<SquareHotwordItem> squareHotwordItems = SquareHotwordModel.fromJson(data[1]).item; //广场热议
        //广场前4个类型
        List listType = data[2]['item'];
        listType.removeRange(5, listType.length);
        List<SquareTypeListModel> squareTypeItems =
            listType.map((i) => SquareTypeListModel.fromJson(i)).toList();
        //广场后面的视频item
        List listItem = data[2]['item'];
        listItem.removeRange(0, 4);
        List<NewsListModel> squareItems =
            listItem.map((i) => NewsListModel.fromJson(i)).toList();

        squareProvider.getRefreshSquareData(
            squareHotwordItems, squareTypeItems, squareItems);
      }
    }
  });
}

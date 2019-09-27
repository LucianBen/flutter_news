import 'dart:convert';

import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/model/square_hotword_model.dart';
import 'package:flutter_news/model/square_typelist_model.dart';
import 'package:flutter_news/provider/square_provider.dart';
import 'package:flutter_news/utils/http.dart';

/*  获取广场数据  */
getSquare(bool isLoad, SquareProvider squareProvider) async {
  await getRequset("squareItems", action: "${isLoad ? "up" : "default"}")
      .then((val) {
    if (val != null) {
      var data = json.decode(val.toString());

      if (isLoad) {
        //加载更多视频
        List<NewsListModel> squareItems = (data[0]['item'] as List)
            .map((i) => NewsListModel.fromJson(i))
            .toList();
        squareProvider.getLoadSquareData(squareItems);
      } else {
        SquareHotwordModel squareHotword =
            SquareHotwordModel.fromJson(data[1]); //广场热议
        //广场前4个类型
        List<SquareTypeListModel> squareTypeItems = (data[2]['item'] as List)
            .sublist(0, 4)
            .map((i) => SquareTypeListModel.fromJson(i))
            .toList();
        //广场后面的视频item
        List<NewsListModel> squareItems = (data[2]['item'] as List)
            .sublist(4)
            .map((i) => NewsListModel.fromJson(i))
            .toList();

        squareProvider.getRefreshSquareData(
            squareHotword, squareTypeItems, squareItems);
      }
    }
  });
}

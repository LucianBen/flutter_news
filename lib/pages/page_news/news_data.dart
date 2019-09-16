import 'dart:convert';

import 'package:flutter_news/provider/news_provider.dart';
import 'package:flutter_news/utils/http.dart';

/*  头条  */
getNewHeadlines(bool isLoad, NewsProvider newsProvider) async {
  if (isLoad) {
    newsProvider.addPage(); //如果是加载，则页数加1
  } else {
    newsProvider.page = 1;
  }
  await getRequset("newsHeadlines",
          id: "SYLB10,SYDT10", action: "down", pullNum: newsProvider.page)
      .then((val) {
    if (val != null) {
      var data = json.decode(val.toString());
      List<Map> topItems = (data[0]['item'] as List).cast(); //置顶新闻
      List<Map> newsItems = (data[1]['item'] as List).cast(); //热点新闻
      if (isLoad) {
        newsProvider.getLoadData(topItems, newsItems);
      } else {
        newsProvider.getRefreshData(topItems, newsItems);
      }
    }
  });
}
/*  视频  */
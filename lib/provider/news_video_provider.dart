import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_video_model.dart';

/*新闻-视频 加载数据 刷新数据*/
class NewsVideoProvider with ChangeNotifier {
  int page = 1;

  addPage() {
    page++;
  }

  List<NewsVideoModel> newsVideoItem = []; //视频

  void getLoadVideoData(List<NewsVideoModel> newsVideoItemList) {
    newsVideoItem.addAll(newsVideoItemList);
    notifyListeners();
  }

  void getRefreshVideoData(List<NewsVideoModel> newsVideoItemList) {
    newsVideoItem = newsVideoItemList;
    notifyListeners();
  }
}

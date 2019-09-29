import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_video_model.dart';

class VideoProvider with ChangeNotifier {
  List<NewsVideoModel> videoList = [];

  void getLoadVideoData(List<NewsVideoModel> videoNewList) {
    List<NewsVideoModel> videoItemTemp = [];
    videoNewList.forEach((item) {
      if (item.type == "videoshortimg") {
        videoItemTemp.add(item);
      }
    });
    videoList.addAll(videoItemTemp);
    notifyListeners();
  }

  void getRefreshVideoData(List<NewsVideoModel> videoNewList) {
    List<NewsVideoModel> videoItemTemp = [];
    videoNewList.forEach((item) {
      if (item.type == "videoshortimg") {
        videoItemTemp.add(item);
      }
    });
    videoList = videoItemTemp;
    notifyListeners();
  }
}

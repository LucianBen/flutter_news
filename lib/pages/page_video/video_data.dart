import 'dart:convert';

import 'package:flutter_news/model/news_video_model.dart';
import 'package:flutter_news/provider/video_provider.dart';
import 'package:flutter_news/utils/http.dart';

/*  获取视频数据  */
getVideo(bool isLoad, VideoProvider videoProvider) async {
  await getRequset("videoItems").then((val) {
    if (val != null) {
      var data = json.decode(val.toString());

      List<NewsVideoModel> videoItems = (data[0]['item'] as List)
          .map((i) => NewsVideoModel.fromJson(i))
          .toList();

      if (isLoad) {
        //加载更多视频
        videoProvider.getLoadVideoData(videoItems);
      } else {
        videoProvider.getRefreshVideoData(videoItems);
      }
    }
  });
}

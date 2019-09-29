import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_news/model/news_video_model.dart';
import 'package:flutter_news/pages/no_data.dart';
import 'package:flutter_news/pages/page_video/video_item.dart';
import 'package:flutter_news/provider/video_provider.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:provider/provider.dart';

import 'video_data.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      margin: EdgeInsets.only(left: 1, right: 1),
      child: _netArchitecture(),
    );
  }

  Widget _netArchitecture() {
    return FutureBuilder(
      future: getRequset("videoItems"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List videoItems = json.decode(snapshot.data.toString())[0]['item'];

          return Consumer<VideoProvider>(
            builder: (context, VideoProvider videoProvider, _) {
              if (videoProvider.videoList.length <= 0) {
                List<NewsVideoModel> videoItemTemp = [];
                videoItems
                    .map((i) => NewsVideoModel.fromJson(i))
                    .toList()
                    .forEach((item) {
                  if (item.type == "videoshortimg") {
                    videoItemTemp.add(item);
                  }
                });
                videoProvider.videoList = videoItemTemp;
              }

              return _netRefreshLoad(videoProvider);
            },
          );
        } else {
          return Nodata();
        }
      },
    );
  }

  Widget _netRefreshLoad(VideoProvider videoProvider) {
    return EasyRefresh(
        header: ClassicalHeader(
            bgColor: Colors.white,
            textColor: Colors.pink,
            infoColor: Colors.pink,
            infoText: '上次更新时间：%T',
            refreshText: '下拉刷新',
            refreshedText: '刷新中...',
            refreshReadyText: '放开即刷新'),
        footer: ClassicalFooter(
          bgColor: Colors.white,
          textColor: Colors.pink,
          infoColor: Colors.pink,
          loadedText: '上拉加载',
          noMoreText: '',
          infoText: '加载中...',
        ),
        onLoad: () async {
          getVideo(true, videoProvider);
        },
        onRefresh: () async {
          getVideo(false, videoProvider);
        },
        child: _videoBody(
            videoProvider.videoList.length, videoProvider.videoList));
  }

  Widget _videoBody(int videosLength, List<NewsVideoModel> videosList) {
    return GridView.builder(
        itemCount: videosLength,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 0.65),
        itemBuilder: (context, index) {
          return VideoItem(
              videosList[index].thumbnail,
              videosList[index].title,
              videosList[index].phvideo.playTime,
              videosList[index].phvideo.praise);
        });
  }
}

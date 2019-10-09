import 'package:flutter/material.dart';
import 'package:flutter_news/pages/news_detail/detail_item_video.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_news/utils/http.dart';

import '../no_data.dart';

class NewsVideoDetail extends StatelessWidget {
  String id;

  NewsVideoDetail(this.id);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "新闻详情-视频页面",
      theme: ThemeData(primaryColor: ThemeColors.colorTheme),
      home: Scaffold(backgroundColor: ThemeColors.colorBackground,
          appBar: AppBar(
            leading: Icon(Icons.arrow_back_ios, color: ThemeColors.colorWhite),
            actions: <Widget>[
              Icon(Icons.more_horiz, color: ThemeColors.colorWhite)
            ],
          ),
          body: Text(id),
          /*body: FutureBuilder(
            future: getUrl(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
//              var data = json.decode(snapshot.data);
//              NewsDetailModel newsDetailModel =
//              NewsDetailModel.fromJson(data['body']);
                return VideoDetailBody();
              } else {
                return Nodata();
              }
            },
          ), */
      ),
    );
  }
}

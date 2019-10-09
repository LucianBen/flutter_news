import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_detail_model.dart';
import 'package:flutter_news/pages/no_data.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_news/utils/http.dart';

import 'detail_item.dart';

///新闻详情页面
class NewsDetail extends StatelessWidget {
  String url;

  NewsDetail(this.url);

  @override
  Widget build(BuildContext context) {
    print("新闻详情url：$url");
    return MaterialApp(
      title: "新闻文章详情",
      theme: ThemeData(primaryColor: ThemeColors.colorTheme),
      home: Scaffold(
        backgroundColor: ThemeColors.colorBackground,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          title: Text("文章详情"),
        ),
        body: FutureBuilder(
          future: getUrl(url),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data);
              NewsDetailModel newsDetailModel =
                  NewsDetailModel.fromJson(data['body']);
              return DetailBody(newsDetailModel);
            } else {
              return Nodata();
            }
          },
        ),
      ),
    );
  }
}

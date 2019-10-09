import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/pages/news_detail/page_news_detail.dart';
import 'package:flutter_news/pages/news_detail/page_news_video.dart';

Handler newsDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String url = params['url']?.first;
  return NewsDetail(url);
});

Handler newsVideoDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String id = params['id']?.first;
  return NewsVideoDetail(id);
});

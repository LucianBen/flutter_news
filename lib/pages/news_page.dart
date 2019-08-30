import 'package:flutter/material.dart';

import 'page_news/appbar_widget.dart';
import 'page_news/news_body.dart';

class NewsPage extends StatelessWidget {
  var searchContext = ["tou偷摸123", '889'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsAppBarHeight(
        preferredSize: Size.fromHeight(50),
        childView: NewsAppbar(
          hintText: searchContext,
          hintClick: () {
            print("点击了搜索");
          },
          findClick: () {
            print("点击了发现");
          },
        ),

      ),
      body: NewsBody(),
    );
  }
}

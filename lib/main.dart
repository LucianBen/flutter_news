import 'package:flutter/material.dart';
import 'package:flutter_news/provider/main_viewpager_provider.dart';
import 'package:flutter_news/provider/news_provider.dart';
import 'package:provider/provider.dart';

import 'main_viewpager_page.dart';
import 'utils/ThemeColors.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: MainViewpagerProvider()),
      ChangeNotifierProvider.value(value: NewsProvider(),)
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '凤凰新闻',
      theme: ThemeData(primaryColor: ThemeColors.colorTheme),
      home: MainViewpagerPage(),
    );
  }
}

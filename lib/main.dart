import 'package:flutter/material.dart';
import 'package:flutter_news/provider/main_viewpager_provider.dart';
import 'package:flutter_news/provider/news_entertainment_provider.dart';
import 'package:flutter_news/provider/news_finance_provider.dart';
import 'package:flutter_news/provider/news_headlines_provider.dart';
import 'package:flutter_news/provider/news_technology_provider.dart';
import 'package:flutter_news/provider/news_video_provider.dart';
import 'package:flutter_news/provider/square_provider.dart';
import 'package:provider/provider.dart';

import 'main_viewpager_page.dart';
import 'provider/news_5G_provider.dart';
import 'provider/news_food_provider.dart';
import 'utils/ThemeColors.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: MainViewpagerProvider()),
      ChangeNotifierProvider.value(value: NewsHeadlinesProvider()),
      ChangeNotifierProvider.value(value: NewsVideoProvider()),
      ChangeNotifierProvider.value(value: NewsFinanceProvider()),
      ChangeNotifierProvider.value(value: NewsEntertainmentProvider()),
      ChangeNotifierProvider.value(value: NewsFoodProvider()),
      ChangeNotifierProvider.value(value: NewsTechnologyProvider()),
      ChangeNotifierProvider.value(value: News5GProvider()),
      ChangeNotifierProvider.value(value: SquareProvider()),
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

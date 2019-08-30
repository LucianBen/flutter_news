import 'package:flutter/material.dart';
import 'package:flutter_news/provider/main_viewpager_provider.dart';
import 'package:provider/provider.dart';

import 'utils/ThemeColors.dart';
import 'main_viewpager_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider.value(value: 0),
      ChangeNotifierProvider.value(value: MainViewpagerProvider()),

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

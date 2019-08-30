import 'package:flutter/material.dart';
import 'package:flutter_news/pages/member_page.dart';
import 'package:flutter_news/pages/news_page.dart';
import 'package:flutter_news/pages/square_page.dart';
import 'package:flutter_news/pages/video_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'utils/ThemeColors.dart';
import 'provider/main_viewpager_provider.dart';

class MainViewpagerPage extends StatelessWidget {
  List<BottomNavigationBarItem> itemBars = [
    BottomNavigationBarItem(
        icon: Icon(Icons.account_balance), title: Text("新闻")),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_balance), title: Text("视频")),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_balance), title: Text("广场")),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_balance), title: Text("未登录")),
  ];

  final List<Widget> widgets = [
    NewsPage(),
    VideoPage(),
    SquarePage(),
    MemberPage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(height: 1920, width: 1080)..init(context);
    return Consumer<MainViewpagerProvider>(
      builder: (context, MainViewpagerProvider mvpProvider, _) => Scaffold(
        backgroundColor: ThemeColors.colorBackground,
        bottomNavigationBar: BottomNavigationBar(
          items: itemBars,
          currentIndex: mvpProvider.currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            mvpProvider.changeIndex(index);
          },
        ),
        body: IndexedStack(
          index: mvpProvider.currentIndex,
          children: widgets,
        ),
      ),
    );
  }
}

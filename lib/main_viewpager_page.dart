import 'package:flutter/material.dart';
import 'package:flutter_news/pages/page_member/member_page.dart';
import 'package:flutter_news/pages/page_news/news_page.dart';
import 'package:flutter_news/pages/page_square/square_page.dart';
import 'package:flutter_news/pages/page_video/video_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'provider/main_viewpager_provider.dart';
import 'utils/ThemeColors.dart';
import 'utils/images_animation.dart';

class MainViewpagerPage extends StatelessWidget {
  List<BottomNavigationBarItem> itemBars = [
    BottomNavigationBarItem(
      icon: Image.asset("images/2.0x/news/news_1.png", width: 30, height: 30),
      title: Text("新闻"),
      activeIcon: ImagesAnimation(
          entry: ImagesAnimationEntry(1, 15, "images/2.0x/news/news_%s.png")),
    ),
    BottomNavigationBarItem(
      icon: Image.asset("images/2.0x/video/video_1.png", width: 30, height: 30),
      title: Text("视频"),
      activeIcon: ImagesAnimation(
          entry: ImagesAnimationEntry(1, 15, "images/2.0x/video/video_%s.png")),
    ),
    BottomNavigationBarItem(
      icon:
          Image.asset("images/2.0x/square/square_1.png", width: 30, height: 30),
      title: Text("广场"),
      activeIcon: ImagesAnimation(
          entry:
              ImagesAnimationEntry(1, 14, "images/2.0x/square/square_%s.png")),
    ),
    BottomNavigationBarItem(
      icon: Image.asset("images/2.0x/account/account_1.png",
          width: 30, height: 30),
      title: Text("未登录"),
      activeIcon: ImagesAnimation(
          entry: ImagesAnimationEntry(
              1, 15, "images/2.0x/account/account_%s.png")),
    )
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

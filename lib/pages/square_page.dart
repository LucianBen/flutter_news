import 'package:flutter/material.dart';
import 'package:flutter_news/pages/page_news/appbar_widget.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SquarePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsAppBarHeight(
        preferredSize: Size.fromHeight(50),
        childView: SquareAppbar(
          hintText: ['微信内存不够啦'],
          hintClick: () {
            print("点击了广场搜索框");
          },
        ),
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }

}

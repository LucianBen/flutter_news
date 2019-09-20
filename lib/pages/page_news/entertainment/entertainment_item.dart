import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_nav_model.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../news_item_content_type.dart';

class EntertainmentNav extends StatelessWidget {
  List<NewsNavModel> newsEntertainmentNavItem;

  EntertainmentNav(this.newsEntertainmentNavItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.colorWhite,
      padding: EdgeInsets.only(left: 10,right: 10),
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(300),
      child: Row(
        children: <Widget>[
          NavItem(newsEntertainmentNavItem,0),
          NavItem(newsEntertainmentNavItem,1),
          NavItem(newsEntertainmentNavItem,2),
          NavItem(newsEntertainmentNavItem,3),
          NavItem(newsEntertainmentNavItem,4),
        ],
      ),
    );
  }

}

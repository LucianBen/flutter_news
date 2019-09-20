import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_nav_model.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../news_item_content_type.dart';

class TechnologyNav extends StatelessWidget {
  List<NewsNavModel> newsTechnologyNavItem;

  TechnologyNav(this.newsTechnologyNavItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.colorWhite,
      padding: EdgeInsets.only(left: 10, right: 10),
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(300),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: newsTechnologyNavItem.length,
          itemBuilder: (context, index) {
            return NavItem(newsTechnologyNavItem, index);
          }),
    );
  }
}

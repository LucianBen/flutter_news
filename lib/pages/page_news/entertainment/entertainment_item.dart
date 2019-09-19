import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_entertainmentNav_model.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../news_item_content_type.dart';

class EntertainmentNav extends StatelessWidget {
  List<NewsEntertainmentNavModel> newsEntertainmentNavItem;

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

//  Widget _navItem(List newsEntertainmentNavItem,int index) {
//    return InkWell(
//      onTap: () {
//        print("娱乐------------$index");
//      },
//      child: Container(
//        width: ScreenUtil().setWidth(200),
//        padding: EdgeInsets.all(10),
//        child: Column(
//          children: <Widget>[
//            Image.network(newsEntertainmentNavItem[index].thumbnail,
//                fit: BoxFit.fill),
//            Text(newsEntertainmentNavItem[index].title)
//          ],
//        ),
//      ),
//    );
//  }
}

import 'package:flutter/material.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsVideoItem extends StatelessWidget {
  final List<Map> itemList;
  final int index;

  NewsVideoItem(this.itemList, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(550),
        child: Stack(
          children: <Widget>[
            Image.network(
              itemList[index]['thumbnail'],
              width: ScreenUtil().setWidth(1080),
              height: ScreenUtil().setHeight(540),
              fit: BoxFit.fill,
            ),
            Center(
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: ThemeColors.colorGrey_2,
                    borderRadius: BorderRadius.circular(180)),
                child: Icon(
                  Icons.play_arrow,
                  color: ThemeColors.colorWhite,
                  size: ScreenUtil().setSp(100),
                ),
              ),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: ThemeColors.colorGrey_2,
                  ),
                  child: Text(
                    "${(itemList[index]['phvideo']['length'] / 60).toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(35),
                        color: ThemeColors.colorWhite),
                  ),
                ))
          ],
        ));
  }
}

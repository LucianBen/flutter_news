import 'package:flutter/material.dart';
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
            Center(child: Icon(Icons.play_arrow)),
            Positioned(bottom: 10, right: 10, child: Text("时间"))
          ],
        ));
  }
}

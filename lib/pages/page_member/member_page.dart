import 'package:flutter/material.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: _memberItem(),
    );
  }
}

Widget _memberItem() {
  return Container(
    color: ThemeColors.colorWhite,
    height: ScreenUtil().setHeight(150),
    padding: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              height: ScreenUtil().setHeight(140),
              width: ScreenUtil().setWidth(310),
              child: Text(
                "Title",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(45),
                    color: ThemeColors.colorBlack),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: ScreenUtil().setWidth(650),
              height: ScreenUtil().setHeight(140),
              padding: EdgeInsets.only(right: 10),
              child: Text(
                "SUBTITLE",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: ScreenUtil().setSp(40)),
              ),
            ),
            Image.asset(
              "images/appwidget_next_btn_default.png",
              width: ScreenUtil().setWidth(80),
            ),
          ],
        ),
        Container(
          color: ThemeColors.colorGrey_10,
          height: 0.5,
        )
      ],
    ),
  );
}

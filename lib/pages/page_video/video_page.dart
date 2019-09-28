import 'package:flutter/material.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      margin: EdgeInsets.only(left: 1, right: 1),
      child: GridView.builder(
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 0.65),
          itemBuilder: (context, index) {
            return _videoItem();
          }),
    );
  }

  Widget _videoItem() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "http://f.hiphotos.baidu.com/image/pic/item/0e2442a7d933c8956c0e8eeadb1373f08202002a.jpg"))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Title",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: ThemeColors.colorWhite,
                  fontSize: ScreenUtil().setSp(45)),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text("12.6万次播放",
                        maxLines: 1,
                        style: TextStyle(
                            color: ThemeColors.colorWhite,
                            fontSize: ScreenUtil().setSp(35)))),
                Image.asset(
                  "images/appwidget_next_btn_default.png",
                  width: ScreenUtil().setWidth(50),
                  fit: BoxFit.cover,
                ),
                Text("2.3万",
                    style: TextStyle(
                        color: ThemeColors.colorWhite,
                        fontSize: ScreenUtil().setSp(35)))
              ],
            ),
          )
        ],
      ),
    );
  }
}

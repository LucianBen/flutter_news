import 'package:flutter/material.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoItem extends StatelessWidget {
  String imageUrl;
  String title;
  String playTime;
  String likes;

  VideoItem(this.imageUrl, this.title, this.playTime, this.likes);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageUrl))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              title,
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
                    child: Text(playTime,
                        maxLines: 1,
                        style: TextStyle(
                            color: ThemeColors.colorWhite,
                            fontSize: ScreenUtil().setSp(35)))),
                Image.asset(
                  "images/horizontal_shortvideo_like_icon.png",
                  width: ScreenUtil().setWidth(40),
                  fit: BoxFit.cover,
                ),
                Text("  $likes",
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

import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/model/news_nav_model.dart';
import 'package:flutter_news/model/square_hotword_model.dart';
import 'package:flutter_news/model/square_typelist_model.dart';
import 'package:flutter_news/pages/page_news/news_item_content_type.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SquareModule1 extends StatelessWidget {
  final List<NewsNavModel> navList;
  final SquareHotwordModel hotList;
  final SquareTypeListModel hourList;

  SquareModule1(this.navList, this.hotList, this.hourList);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.colorWhite,
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          _squareNav(navList),
          _squareHot(hotList),
          _squareHour(hourList)
        ],
      ),
    );
  }

//广场-导航
  Widget _squareNav(List<NewsNavModel> navList) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: navList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return NavItem(navList, index);
          }),
    );
  }

//广场-热议
  Widget _squareHot(SquareHotwordModel hotList) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(430),
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.network(
                hotList.chConfig.titleIcon,
                fit: BoxFit.cover,
                width: ScreenUtil().setWidth(60),
              ),
              Text(
                " ${hotList.chConfig.desc}",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(45),
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
//          mainAxisSpacing: 2,// 竖向间距
            crossAxisSpacing: 10,
            // 横向间距
            primary: false,
//          padding: const EdgeInsets.all(5.0),
            childAspectRatio: 6.0,
            children: List.generate(hotList.item.length, (index) {
              return _textImage(hotList.item[index].title,
                  hotList.item[index].titleIcon, index);
            }),
          )
        ],
      ),
    );
  }

  Widget _textImage(String data, String src, int index) {
    return Container(
      height: ScreenUtil().setHeight(45),
      width: ScreenUtil().setWidth(100),
      child: InkWell(
        onTap: () {
          print("点击了$index");
        },
        child: Row(
          children: <Widget>[
            Text(
              "$data   ",
              style: TextStyle(fontSize: ScreenUtil().setSp(40)),
            ),
            Image.network(
              src,
              fit: BoxFit.cover,
              width: ScreenUtil().setWidth(65),
            ),
          ],
        ),
      ),
    );
  }

//广场-24小时
  Widget _squareHour(SquareTypeListModel hourList) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(250),
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: ThemeColors.colorWhite,
        border: new Border.all(color: ThemeColors.colorGrey_10, width: 0.5),
        boxShadow: [
          BoxShadow(
              color: ThemeColors.colorGrey_10,
              blurRadius: 5.0,
              spreadRadius: 2.0),
        ],
      ),
      child: Row(
        children: <Widget>[
          Image.network(
            hourList.titleIcon,
            width: ScreenUtil().setWidth(300),
          ),
          Container(
            width: 1,
            color: ThemeColors.colorGrey,
            margin: EdgeInsets.only(top: 20, bottom: 20),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 5),
            width: ScreenUtil().setWidth(680),
            child: Text(
              hourList.marqueeList[0].title,
              maxLines: 2,
              style: TextStyle(fontSize: ScreenUtil().setSp(40)),
            ),
          )
        ],
      ),
    );
  }
}

//广场-热点聚焦
class SquareSpotlight extends StatelessWidget {
  final SquareTypeListModel hotspotList;

  SquareSpotlight(this.hotspotList);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//广场-精品有声书
class SquareAudiobook extends StatelessWidget {
  final SquareTypeListModel readList;

  SquareAudiobook(this.readList);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//广场-原创精品
Widget squareBoutique(SquareTypeListModel boutiqueList) {
  return Container();
}

//广场-精选视频
Widget squareVideo(List<NewsListModel> videoList) {
  return Container();
}

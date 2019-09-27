import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_nav_model.dart';
import 'package:flutter_news/model/square_hotword_model.dart';
import 'package:flutter_news/model/square_typelist_model.dart';
import 'package:flutter_news/pages/page_news/news_item_content_type.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 广场-导航、热议、24小时
class SquareModule1 extends StatelessWidget {
  final List<NewsNavModel> navList;
  final SquareHotwordModel hotList;
  final SquareTypeListModel hourList;

  SquareModule1(this.navList, this.hotList, this.hourList);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.colorWhite,
      padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.only(bottom: 10),
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
      height: ScreenUtil().setHeight(330),
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
          _squareTitle(hotList.chConfig.titleIcon, hotList.chConfig.desc),
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

/// 广场-热点聚焦
class SquareSpotlight extends StatelessWidget {
  final SquareTypeListModel hotspotList;

  SquareSpotlight(this.hotspotList);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.colorWhite,
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(650),
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          _listSpotlight(),
          _moreSpotlight(),
        ],
      ),
    );
  }

  Widget _listSpotlight() {
    return Container(
      height: ScreenUtil().setHeight(500),
      margin: EdgeInsets.only(bottom: 10),
      child: Stack(
        children: <Widget>[
          Swiper(
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.95,
            scale: 0.9,
            loop: false,
            itemCount: hotspotList.relation.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: ThemeColors.colorWhite,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image:
                            NetworkImage(hotspotList.relation[index].thumbnail),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: <Widget>[
                    _spotlightTitle(index),
                  ],
                ),
              );
            },
          ),
          Positioned(
            left: 20,
            top: 10,
            child: _squareTitle(hotspotList.titleIcon, hotspotList.title,
                color: ThemeColors.colorWhite),
          ),
        ],
      ),
    );
  }

  Widget _spotlightTitle(int index) {
    return Positioned(
      width: ScreenUtil().setWidth(800),
      left: 10,
      bottom: 10,
      child: Text(
        "${hotspotList.relation[index].title}",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: ThemeColors.colorWhite,
          fontWeight: FontWeight.w700,
          fontSize: ScreenUtil().setSp(40),
        ),
      ),
    );
  }

  Widget _moreSpotlight() {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "查看更多热点  >",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(40),
            ),
          )
        ],
      ),
    );
  }
}

/// 广场-精品有声书
class SquareAudiobook extends StatelessWidget {
  final SquareTypeListModel readList;

  SquareAudiobook(this.readList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      color: ThemeColors.colorWhite,
      height: ScreenUtil().setHeight(767),
      child: InkWell(
        onTap: () {
          print("===== 广场单图展示 ----------> ${readList.link}");
        },
        child: Column(
          children: <Widget>[
            _squareTitle(readList.titleIcon, readList.title),
            Container(
              width: ScreenUtil().setWidth(1030),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              height: ScreenUtil().setHeight(550),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(readList.thumbnail),
                      fit: BoxFit.cover)),
            ),
            ItemBottomLayout(readList.source, readList.commentsall)
          ],
        ),
      ),
    );
  }
}

/// 广场-原创精品
class SquareBoutique extends StatelessWidget {
  final SquareTypeListModel boutiqueList;

  SquareBoutique(this.boutiqueList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      color: ThemeColors.colorWhite,
      width: ScreenUtil().setWidth(1080),
      child: Column(
        children: <Widget>[
          _squareTitle(boutiqueList.titleIcon, boutiqueList.title,
              subtitle: boutiqueList.subTitle),
          Container(
            height: ScreenUtil().setHeight(600),
            color: ThemeColors.colorWhite,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: boutiqueList.marqueeList.length,
                itemBuilder: (context, index) {
                  Color color = ThemeColors.colorRed;
                  switch (index % 3) {
                    case 0:
                      color = ThemeColors.colorRed;
                      break;
                    case 1:
                      color = ThemeColors.colorOrange;
                      break;
                    case 2:
                      color = ThemeColors.colorBule;
                      break;
                  }

                  return InkWell(
                      onTap: () {
                        print("square_item:精品有声$index");
                      },
                      child: _boutiqueItem(
                          boutiqueList.marqueeList[index], color));
                }),
          )
        ],
      ),
    );
  }

  Widget _boutiqueItem(MarqueeList itemMarquee, Color color) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 5),
      width: ScreenUtil().setWidth(500),
      height: ScreenUtil().setHeight(750),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ThemeColors.colorGrey_10, width: 0.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            itemMarquee.thumbnail,
            width: ScreenUtil().setWidth(500),
            height: ScreenUtil().setHeight(300),
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
            child: Text(
              "O ${itemMarquee.source}",
              style: TextStyle(color: color),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: Text(
              itemMarquee.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: ThemeColors.colorBlack,
                  fontSize: ScreenUtil().setSp(40)),
            ),
          )
        ],
      ),
    );
  }
}

class SquareTitle extends StatelessWidget {
  String imageUrl;
  String title;
  String subtitle;
  Color color;

  SquareTitle(this.imageUrl, this.title, {this.subtitle, this.color});

  @override
  Widget build(BuildContext context) {
    if (subtitle == null) {
      return _squareTitle(imageUrl, title, color: color);
    } else {
      return _squareTitle(imageUrl, title, subtitle: subtitle, color: color);
    }
  }
}

Widget _squareTitle(String imageUrl, String title,
    {String subtitle = "", Color color}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: ScreenUtil().setWidth(70),
      ),
      Text(
        " $title",
        style: TextStyle(
            fontSize: ScreenUtil().setSp(45),
            fontWeight: FontWeight.w700,
            color: color),
      ),
      Text(
        "  $subtitle",
        style: TextStyle(fontSize: ScreenUtil().setSp(35), color: color),
      ),
    ],
  );
}

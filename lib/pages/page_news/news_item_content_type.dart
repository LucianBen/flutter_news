import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 新闻-轮播图
class NewsHeadlineSwiper extends StatelessWidget {
  final List imageList;

  NewsHeadlineSwiper(this.imageList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageList.length > 0
          ? ScreenUtil().setHeight(500)
          : ScreenUtil().setHeight(0),
      margin: EdgeInsets.only(
          top: imageList.length > 0 ? 10 : 0,
          bottom: imageList.length > 0 ? 10 : 0),
      child: Swiper(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        autoplay: true,
        viewportFraction: 0.8,
        // 当前视窗展示比例 小于1可见上一个和下一个视窗
        scale: 0.9,
        // 两张图片之间的间隔
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(imageList[index]), fit: BoxFit.fill)),
          );
        },
        onTap: (index) {
          print("news_body/${index}");
        },
      ),
    );
  }
}

/// 新闻-内容-单张图片
class NewsItemsSingleImage extends StatelessWidget {
  final List<NewsListModel> itemList;
  final int index;

  NewsItemsSingleImage(this.itemList, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1),
      width: ScreenUtil().setWidth(1080),
      padding: EdgeInsets.all(10),
      color: ThemeColors.colorWhite,
      child: InkWell(
        onTap: () {
          print("===== 单图展示 ----------> ${itemList[index]}");
        },
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(200),
                  width: ScreenUtil().setWidth(660),
                  alignment: Alignment.topLeft,
                  child: Text(
                    itemList[index].title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: ThemeColors.colorBlack,
                        fontSize: ScreenUtil().setSp(40)),
                  ),
                ),
                Image.network(
                  itemList[index].thumbnail,
                  width: ScreenUtil().setWidth(350),
                  height: ScreenUtil().setHeight(200),
                ),
              ],
            ),
            _itemBottomLayout(itemList, index)
          ],
        ),
      ),
    );
  }
}

/// 新闻-内容-三张图片
class NewsItemsSlideImage extends StatelessWidget {
  final List<NewsListModel> itemList;
  final int index;

  NewsItemsSlideImage(this.itemList, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 1),
        width: ScreenUtil().setWidth(1080),
        padding: EdgeInsets.all(10),
        color: ThemeColors.colorWhite,
        child: InkWell(
          onTap: () {
            print("点击多张图");
          },
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  itemList[index].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: ThemeColors.colorBlack,
                      fontSize: ScreenUtil().setSp(40)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    Image.network(itemList[index].style.images[0],
                        height: ScreenUtil().setHeight(250),
                        width: ScreenUtil().setWidth(330),
                        fit: BoxFit.fill),
                    Container(width: 2, color: ThemeColors.colorWhite),
                    Image.network(itemList[index].style.images[1],
                        height: ScreenUtil().setHeight(250),
                        width: ScreenUtil().setWidth(330),
                        fit: BoxFit.fill),
                    Container(width: 2, color: ThemeColors.colorWhite),
                    Image.network(itemList[index].style.images[2],
                        height: ScreenUtil().setHeight(250),
                        width: ScreenUtil().setWidth(330),
                        fit: BoxFit.fill),
                  ],
                ),
              ),
              _itemBottomLayout(itemList, index),
            ],
          ),
        ));
  }
}

/// 新闻-内容-视频
class NewsItemsVideo extends StatelessWidget {
  final List<NewsListModel> itemList;
  final int index;

  NewsItemsVideo(this.itemList, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 1),
        width: ScreenUtil().setWidth(1080),
        padding: EdgeInsets.all(10),
        color: ThemeColors.colorWhite,
        child: InkWell(
          onTap: () {
            print("点击视频");
          },
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  itemList[index].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: ThemeColors.colorBlack,
                      fontSize: ScreenUtil().setSp(40)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 10),
                child: _itemNewsVideo(),
              ),
              _itemBottomLayout(itemList, index),
            ],
          ),
        ));
  }

  Widget _itemNewsVideo() {
    return Container(
        width: ScreenUtil().setWidth(1060),
        height: ScreenUtil().setHeight(540),
        child: Stack(
          children: <Widget>[
            Image.network(
              itemList[index].thumbnail,
              width: ScreenUtil().setWidth(1060),
              height: ScreenUtil().setHeight(530),
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
                    "${(itemList[index].phvideo.length  / 60).toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(35),
                        color: ThemeColors.colorWhite),
                  ),
                ))
          ],
        ));
  }
}

/// 新闻-头条-内容-item的底部布局，有来源、评论和关闭
Widget _itemBottomLayout(List<NewsListModel> itemList, int index) {
  String commitAll = itemList[index].commentsall.toString();
  if (commitAll == "0") {
    commitAll = "";
  } else {
    commitAll = "${itemList[index].commentsall}评";
  }
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              itemList[index].source == null
                  ? itemList[index].subscribe.catename == null
                      ? ""
                      : itemList[index].subscribe.catename
                  : itemList[index].source,
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
            ),
            Text(
              "    $commitAll",
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
            ),
          ],
        ),
        Positioned(
          right: 15,
          top: 0,
          child: InkWell(
            onTap: () {
              print("点击了X");
            },
            child: Image.asset("images/close.png",
                width: ScreenUtil().setWidth(30),
                height: ScreenUtil().setHeight(30)),
          ),
        ),
      ],
    ),
  );
}

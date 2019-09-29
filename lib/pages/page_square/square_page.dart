import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/model/news_nav_model.dart';
import 'package:flutter_news/model/square_hotword_model.dart';
import 'package:flutter_news/model/square_typelist_model.dart';
import 'package:flutter_news/pages/page_news/appbar_widget.dart';
import 'package:flutter_news/pages/page_news/news_item_content_type.dart';
import 'package:flutter_news/provider/square_provider.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../no_data.dart';
import 'square_data.dart';
import 'square_item.dart';

class SquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsAppBarHeight(
        preferredSize: Size.fromHeight(50),
        childView: SquareAppbar(
          hintText: ['微信内存不够啦'],
          hintClick: () {
            print("点击了广场搜索框");
          },
        ),
      ),
      body: _netArchitecture(),
    );
  }

  SquareHotwordModel squareHotwordModel;

  Widget _netArchitecture() {
    return FutureBuilder(
      future: getRequset("squareItems", action: "default"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List dataSquareNavList =
              json.decode(snapshot.data.toString())[0]['item']; //广场导航
          squareHotwordModel = SquareHotwordModel.fromJson(
              json.decode(snapshot.data.toString())[1]); //广场热议
          List dataSquareList =
              json.decode(snapshot.data.toString())[2]['item'];

          return Consumer<SquareProvider>(
              builder: (context, SquareProvider squareProvider, _) {
            if (squareProvider.squareList.length <= 0) {
              squareProvider.squareNav = dataSquareNavList
                  .map((i) => NewsNavModel.fromJson(i))
                  .toList();
              //广场前4个类型
              squareProvider.squareTypeList = dataSquareList
                  .sublist(0, 4)
                  .map((i) => SquareTypeListModel.fromJson(i))
                  .toList();
              //广场后面的视频item
              squareProvider.squareList = dataSquareList
                  .sublist(4)
                  .map((i) => NewsListModel.fromJson(i))
                  .toList();
            }

            return _netRefreshLoad(squareProvider);
          });
        } else {
          return Nodata();
        }
      },
    );
  }

  Widget _netRefreshLoad(SquareProvider squareProvider) {
    return EasyRefresh(
        header: ClassicalHeader(
            bgColor: Colors.white,
            textColor: Colors.pink,
            infoColor: Colors.pink,
            infoText: '上次更新时间：%T',
            refreshText: '下拉刷新',
            refreshedText: '刷新中...',
            refreshReadyText: '放开即刷新'),
        footer: ClassicalFooter(
          bgColor: Colors.white,
          textColor: Colors.pink,
          infoColor: Colors.pink,
          loadedText: '上拉加载',
          noMoreText: '',
          infoText: '加载中...',
        ),
        onLoad: () async {
          getSquare(true, squareProvider);
        },
        onRefresh: () async {
          getSquare(false, squareProvider);
        },
        child: _newsSquareBody(squareProvider));
  }

  Widget _newsSquareBody(SquareProvider squareProvider) {
    return ListView(
      children: <Widget>[
        SquareModule1(squareProvider.squareNav, squareHotwordModel,
            squareProvider.squareTypeList[0]),
        SquareSpotlight(squareProvider.squareTypeList[1]),
        SquareAudiobook(squareProvider.squareTypeList[2]),
        SquareBoutique(squareProvider.squareTypeList[3]),
        _newsItemTile(squareProvider.squareList[0]),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: squareProvider.squareList.length,
            itemBuilder: (context, index) {
              return NewsItemsVideo(squareProvider.squareList, index);
            }),
      ],
    );
  }

  Widget _newsItemTile(NewsListModel itemVideoTile) {
    return Container(
      color: ThemeColors.colorWhite,
      padding: EdgeInsets.only(left: 10, top: 10),
      height: ScreenUtil().setHeight(90),
      width: ScreenUtil().setWidth(1080),
      child: SquareTitle(
          itemVideoTile.navigationIcon, itemVideoTile.navigationTitle),
    );
  }
}

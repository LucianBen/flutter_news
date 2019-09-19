import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_news/model/news_finance_model.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_news/provider/news_finance_provider.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../no_data.dart';
import '../news_data.dart';
import '../news_item.dart';
import 'finance_item.dart';

///新闻-财经
class NewsFinance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(1920),
      width: ScreenUtil().setWidth(1080),
      child: NetArchitecture(),
    );
  }

  Widget NetArchitecture() {
    return FutureBuilder(
      future: getRequset("newsFinance", id: "CJ33,FOCUSCJ33", action: "down"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List dataLiveRoom = json.decode(snapshot.data.toString())[0]['item'];
          List dataNewsList = json.decode(snapshot.data.toString())[1]['item'];
          return Consumer<NewsFinanceProvider>(
              builder: (context, NewsFinanceProvider newsFinanceProvider, _) {
            if (newsFinanceProvider.newsFinanceListItem.length <= 0) {
              newsFinanceProvider.newsFinanceListItem =
                  dataNewsList.map((i) => NewsListModel.fromJson(i)).toList();
              newsFinanceProvider.newsFinanceLiveRoomItem = dataLiveRoom
                  .map((i) => NewsFinanceLiveRoomModel.fromJson(i))
                  .toList();
            }

            return NetRefreshLoad(newsFinanceProvider);
          });
        } else {
          return Nodata();
        }
      },
    );
  }

  Widget NetRefreshLoad(NewsFinanceProvider newsFinanceProvider) {
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
          getNewsFinance(true, newsFinanceProvider);
        },
        onRefresh: () async {
          getNewsFinance(false, newsFinanceProvider);
        },
        child: NewsFinanceBody(newsFinanceProvider));
  }

  Widget NewsFinanceBody(NewsFinanceProvider newsFinanceProvider) {
    return ListView(
      children: <Widget>[
        FundIndex(),
        LiveRoom(newsFinanceProvider.newsFinanceLiveRoomItem),
        NewsList(newsFinanceProvider.newsFinanceListItem),
      ],
    );
  }
}

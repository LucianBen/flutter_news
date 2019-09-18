import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_news/provider/news_headlines_provider.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:provider/provider.dart';

import '../../no_data.dart';
import '../news_data.dart';
import 'news_headline_content_type.dart';

///新闻-头条
class NewsHeadline extends StatelessWidget {
  List swiperImages = [
//    "https://d.ifengimg.com/w230_h152_q100_aix16_aiy0_aiw614_aih407_webp/x0.ifengimg.com/res/2019/3D6F15F00862AB47AA73F1E3315DD4EF596BCCC1_size51_w640_h407.jpeg.webp",
//    "https://d.ifengimg.com/w230_h152_q100_aix89_aiy0_aiw1360_aih900_webp/x0.ifengimg.com/res/2019/C592DD4AD733230C237F312FCFFF08C659CA9C68_size219_w1600_h900.jpeg.webp"
  ];

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return FutureBuilder(
        future:
            getRequset("newsHeadlines", id: "SYLB10,SYDT10", action: "down"),
        builder: (context, snapshot) {
          return Consumer<NewsHeadlinesProvider>(
            builder: (context, NewsHeadlinesProvider newsHeadlinesProvider, _) {
              if (snapshot.hasData) {
                if (newsHeadlinesProvider.newsItems.length <= 0) {
                  var data = json.decode(snapshot.data.toString());
                  newsHeadlinesProvider.topItems =
                      (data[0]['item'] as List).cast(); //置顶新闻
                  newsHeadlinesProvider.newsItems =
                      (data[1]['item'] as List).cast(); //热点新闻
                }
                return EasyRefresh(
                    header: ClassicalHeader(
                        bgColor: Colors.pink,
                        textColor: Colors.white,
                        infoColor: Colors.white,
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
                      getNewHeadlines(true, newsHeadlinesProvider);
                    },
                    onRefresh: () async {
                      getNewHeadlines(false, newsHeadlinesProvider);
                    },
                    child: _simpleListView(
                        newsHeadlinesProvider, scrollController));
              } else {
                return InkWell(
                  onTap: () {
                    getRequset("newsHeadlines",
                            id: "SYLB10,SYDT10", action: "down", pullNum: 1)
                        .then((val) {
//                      print("+++++++++++++++onRefresh ${newsHeadlinesProvider.page}");
                      var data = json.decode(val.toString());
                      List<Map> topItems =
                          (data[0]['item'] as List).cast(); //置顶新闻
                      List<Map> newsItems =
                          (data[1]['item'] as List).cast(); //热点新闻
                      newsHeadlinesProvider.getRefreshData(topItems, newsItems);
                    });
                  },
                  child: Nodata(),
                );
              }
            },
          );
        });
  }

  Widget _simpleListView(
      NewsHeadlinesProvider newsHeadlinesProvider, scrollController) {
    return ListView(
      children: <Widget>[
        NewsHeadlineSwiper(swiperImages),
        ListView.builder(
          //解决无限高度问题
          shrinkWrap: true,
          //禁用滑动事件
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: scrollController,
          itemCount: newsHeadlinesProvider.topItems.length,
          itemBuilder: (context, index) {
            return NewsHeadlineTop(newsHeadlinesProvider.topItems, index);
          },
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          controller: scrollController,
          itemCount: newsHeadlinesProvider.newsItems.length,
          itemBuilder: (context, index) {
            if (newsHeadlinesProvider.newsItems[index]['showType'] == '0' &&
                newsHeadlinesProvider.newsItems[index]['style']
                        ['recomReason'] !=
                    null) {
              //热点展示
              return NewsHeadlineItemsHot(
                  newsHeadlinesProvider.newsItems, index);
            } else if (newsHeadlinesProvider.newsItems[index]['showType'] ==
                    '0' &&
                newsHeadlinesProvider.newsItems[index]['hasSlide'] == null) {
              //单图展示
              return NewsHeadlineItemsSingleImage(
                  newsHeadlinesProvider.newsItems, index);
            } else if (newsHeadlinesProvider.newsItems[index]['showType'] ==
                    '0' &&
                newsHeadlinesProvider.newsItems[index]['hasSlide'] == true) {
              //三图展示
              return NewsHeadlineItemsSlideImage(
                  newsHeadlinesProvider.newsItems, index);
            } else if (newsHeadlinesProvider.newsItems[index]['showType'] ==
                '1') {
              //视频展示
              return NewsHeadlineItemsVideo(
                  newsHeadlinesProvider.newsItems, index);
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_news/provider/news_provider.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:provider/provider.dart';

import 'news_headline_content_type.dart';

//新闻-头条
class NewsHeadline extends StatelessWidget {
  List swiperImages = [
//    "https://d.ifengimg.com/w230_h152_q100_aix16_aiy0_aiw614_aih407_webp/x0.ifengimg.com/res/2019/3D6F15F00862AB47AA73F1E3315DD4EF596BCCC1_size51_w640_h407.jpeg.webp",
//    "https://d.ifengimg.com/w230_h152_q100_aix89_aiy0_aiw1360_aih900_webp/x0.ifengimg.com/res/2019/C592DD4AD733230C237F312FCFFF08C659CA9C68_size219_w1600_h900.jpeg.webp"
  ];

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return Consumer<NewsProvider>(builder: (context, NewsProvider newsProvider, _) {
      return FutureBuilder(
        future: getRequset("newsHeadlines",
            id: "SYLB10,SYDT10", action: "down", pullNum: newsProvider.page),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            List<Map> topItems = (data[0]['item'] as List).cast(); //置顶新闻
            List<Map> newsItems = (data[1]['item'] as List).cast(); //热点新闻
            newsProvider.getRefreshData(topItems, newsItems);
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
                  print("======== 加载更多 ========="); //获取火爆商品数据
                  newsProvider.addPage();
                  getRequset("newsHeadlines ",
                          id: "SYLB10,SYDT10",
                          action: "down",
                          pullNum: newsProvider.page)
                      .then((val) {
                        print("++++++++++++++onLoad  ${newsProvider.page}");
                    var data = json.decode(snapshot.data.toString());
                    topItems = (data[0]['item'] as List).cast(); //置顶新闻
                    List<Map> newNewsItems =
                        (data[1]['item'] as List).cast(); //热点新闻

                    newsProvider.getLoadData(topItems, newNewsItems);
                  });
                },
                onRefresh: () async {
                  getRequset("newsHeadlines",
                          id: "SYLB10,SYDT10", action: "down", pullNum: 1)
                      .then((val) {
                        print("+++++++++++++++onRefresh ${newsProvider.page}");
                    var data = json.decode(snapshot.data.toString());
                    topItems = (data[0]['item'] as List).cast(); //置顶新闻
                    newsItems = (data[1]['item'] as List).cast(); //热点新闻
                    newsProvider.getRefreshData(topItems, newsItems);
                  });
                },
                child: ListView(
                  children: <Widget>[
                    NewsHeadlineSwiper(swiperImages),
                    ListView.builder(
                      //解决无限高度问题
                      shrinkWrap: true,
                      //禁用滑动事件
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      controller: scrollController,
                      itemCount: newsProvider.topItems.length,
                      itemBuilder: (context, index) {
                        return NewsHeadlineTop(newsProvider.topItems, index);
                      },
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      controller: scrollController,
                      itemCount: newsProvider.newsItems.length,
                      itemBuilder: (context, index) {
                        if (newsProvider.newsItems[index]['showType'] == '0' &&
                            newsProvider.newsItems[index]['style']['recomReason'] !=
                                null) {
                          //热点展示
                          return NewsHeadlineItemsHot(newsProvider.newsItems, index);
                        } else if (newsProvider.newsItems[index]['showType'] == '0' &&
                            newsProvider.newsItems[index]['hasSlide'] == null) {
                          //单图展示
                          return NewsHeadlineItemsSingleImage(
                              newsProvider.newsItems, index);
                        } else if (newsProvider.newsItems[index]['showType'] == '0' &&
                            newsProvider.newsItems[index]['hasSlide'] == true) {
                          //三图展示
                          return NewsHeadlineItemsSlideImage(
                              newsProvider.newsItems, index);
                        } else if (newsProvider.newsItems[index]['showType'] == '1') {
                          //视频展示
                          return NewsHeadlineItemsVideo(newsProvider.newsItems, index);
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                ));
          } else {
            return Text("暂无数据");
          }
        },
      );
    });
  }
}

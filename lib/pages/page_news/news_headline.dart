import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news/utils/http.dart';

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
    return FutureBuilder(
      future: getRequset("newsHeadlines",
          id: "SYLB10,SYDT10", action: "down", pullNum: "1"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = json.decode(snapshot.data.toString());
          List<Map> topItems = (data[0]['item'] as List).cast(); //置顶新闻
          List<Map> newsItems = (data[1]['item'] as List).cast(); //热点新闻
          newsItems.addAll(topItems);
          return Column(
            children: <Widget>[
              NewsHeadlineSwiper(swiperImages),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                controller: scrollController,
                itemCount: topItems.length,
                itemBuilder: (context, index) {
                  return NewsHeadlineTop(topItems, index);
                },
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  controller: scrollController,
                  itemCount: newsItems.length,
                  itemBuilder: (context, index) {
                    /*if (newsItems[index]['showType'] == '0' &&
                        !(newsItems[index]['style']['recomReason']
                                ['reasonName'] ==
                            null)) {
                      //热点展示
                      return NewsHeadlineItemsHot(newsItems, index);
                    } else*/
                    if (newsItems[index]['showType'] == '0' &&
                        newsItems[index]['hasSlide'] == null) {
                      //单图展示
                      return NewsHeadlineItemsSingleImage(newsItems, index);
                    } else if (newsItems[index]['showType'] == '0' &&
                        newsItems[index]['hasSlide'] == true) {
                      //三图展示
                      return NewsHeadlineItemsSlideImage(newsItems, index);
                    } else if (newsItems[index]['showType'] == '1') {
                      //视频展示
                      return NewsHeadlineItemsVideo(newsItems, index);
                    } else {
                      return Container();
                    }
                  },
                ),
              )
            ],
          );
        } else {
          return Text("暂无数据");
        }
      },
    );
  }
}

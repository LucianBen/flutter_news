import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_finance_model.dart';
import 'package:flutter_news/model/news_item_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'news_item_content_type.dart';

//ListView新闻列表
class NewsList extends StatelessWidget {
  List<NewsListModel> newsListItem;

  NewsList(this.newsListItem);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(1080),
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: newsListItem.length,
            itemBuilder: (context, index) {
              return _newsItem(index);
            }));
  }

  Widget _newsItem(int index) {
    if (newsListItem[index].showType == '0' &&
        newsListItem[index].hasSlide == null) {
      //单图展示
      return NewsItemsSingleImage(newsListItem, index);
    } else if (newsListItem[index].showType == '0' &&
        newsListItem[index].hasSlide == true) {
      //三图展示
      return NewsItemsSlideImage(newsListItem, index);
    } else if (newsListItem[index].showType == '1'&&
        newsListItem[index].type == 'phvideo') {
      //视频展示
      return NewsItemsVideo(newsListItem, index);
    } else {
      return Container();
    }
  }
}

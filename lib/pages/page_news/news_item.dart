import 'package:flutter/material.dart';
import 'package:flutter_news/model/NewsFinanceModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'news_item_content_type.dart';

//ListView新闻列表
class FinanceNewsList extends StatelessWidget {
  List<NewsListModel> newsFinanceListItem;

  FinanceNewsList(this.newsFinanceListItem);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(1080),
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: newsFinanceListItem.length,
            itemBuilder: (context, index) {
              return _newsItem(index);
            }));
  }

  Widget _newsItem(int index) {
    if (newsFinanceListItem[index].showType == '0' &&
        newsFinanceListItem[index].hasSlide == null) {
      //单图展示
      return NewsItemsSingleImage(newsFinanceListItem, index);
    } else if (newsFinanceListItem[index].showType == '0' &&
        newsFinanceListItem[index].hasSlide == true) {
      //三图展示
      return NewsItemsSlideImage(newsFinanceListItem, index);
    } else if (newsFinanceListItem[index].showType == '1') {
      //视频展示
      return NewsItemsVideo(newsFinanceListItem, index);
    } else {
      return Container();
    }
  }
}

import 'package:flutter/material.dart';

import 'video_item.dart';

//新闻-视频
class NewsVideo extends StatelessWidget {
  List list = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemCount: 3, itemBuilder: (context, index) {
        return VideoItem();
      }),
    );
  }
}

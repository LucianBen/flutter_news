import 'package:flutter/material.dart';
import 'package:flutter_news/utils/http.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsNovel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(1500),
      child: WebviewScaffold(
        scrollBar: false,
        url: kindUrl['newsFiction'],
      ),
    );
  }
}

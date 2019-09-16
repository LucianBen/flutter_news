import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsNovel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url:
          "https://fhxw.iyc.ifeng.com/?cid=70004&gv=6.6.5&av=6.6.5&uid=276130dd7d659baa&deviceid=276130dd7d659baa&proid=ifengnews&os=android_25&df=androidphone&vt=5&screen=720x1280&publishid=2011&nw=disconnected&loginid=&st=15669849217573&sn=57b09bea2c72782b5fdf3d5fd6757770",
    );
  }
}

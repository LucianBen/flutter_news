import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'router_handler.dart';

class BaseRouter {
  static Router router;

  static String root = "/";
  static String detailPage = "/newsDetail";
  static String detailVideoPage = "/newsVideoDetail";

  static void configureRouter(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("没有找到路由");
        return;
      },
    );

    router.define(detailPage, handler: newsDetailHandler);
    router.define(detailVideoPage, handler: newsVideoDetailHandler);
  }
}

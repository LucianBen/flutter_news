import 'package:flutter/material.dart';
import 'package:flutter_news/pages/page_member/member_item.dart';
import 'package:flutter_news/utils/ThemeColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  final List<String> titleList = [
    "",
    "",
    "我的消息",
    "养生答题",
    "我的钱包",
    "我的已购",
    "我的书架",
    "我的缓存",
    "",
    "金币商城",
    "管理大风号",
    "",
    "投诉反馈",
    "设置",
  ];
  final List subtitle = [
    "",
    "",
    "评论点赞/系统通知",
    "破谣言赢养生佳品",
    "",
    "",
    "",
    "",
    "",
    "免费抢全国25城中医问诊名",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: ListView.builder(
          itemCount: 14,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return UnLoginSign();
                break;
              case 1:
                return UnLoginRegister();
                break;
              case 8:
              case 11:
                return _blankCross();
                break;
              default:
                return MemberItem(titleList[index], subtitle[index]);
                break;
            }
          }),
    );
  }

  Widget _blankCross() {
    return Container(
      height: ScreenUtil().setHeight(20),
      width: ScreenUtil().setWidth(1080),
      color: ThemeColors.colorGrey_10,
    );
  }
}

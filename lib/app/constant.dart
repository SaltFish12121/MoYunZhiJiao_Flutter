import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class Constant {
  static const String kUpdateFollow = "UpdateFollow";
  static const String kUpdateHistory = "UpdateHistory";

  static final Map<String, HomePageItem> allHomePages = {
    "main": HomePageItem(
      iconData: Remix.home_smile_line,
      title: "首页",
      index: 0,
    ),
    "exercise": HomePageItem(
      iconData: Remix.heart_line,
      title: "书法练习",
      index: 1,
    ),
    "competition": HomePageItem(
      iconData: Remix.apps_line,
      title: "书法竞赛",
      index: 2,
    ),
    "message": HomePageItem(
      iconData: Remix.message_2_fill,
      title: "消息",
      index: 3,
    ),
    "user": HomePageItem(
      iconData: Remix.user_smile_line,
      title: "我的",
      index: 4,
    ),
  };
}

class HomePageItem {
  final IconData iconData;
  final String title;
  final int index;
  HomePageItem({
    required this.iconData,
    required this.title,
    required this.index,
  });
}

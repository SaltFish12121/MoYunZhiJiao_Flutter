import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:moyunzhijiao/modules/mainpage/calligraphy_competition/calligraphy_competition_page.dart';
import 'package:moyunzhijiao/modules/mainpage/calligraphy_knowledge/calligraphy_knowledge_page.dart';
import 'package:moyunzhijiao/modules/mainpage/calligraphy_teachingVideo/calligraphy_teachingVideo_page.dart';
import 'package:moyunzhijiao/modules/mainpage/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // 模拟数据
  static List<KnowledgeInfo> demoKnowledgeList = [
    KnowledgeInfo(
      id: '1',
      cover: 'https://example.com/image1.jpg',
      title: '书法技巧1',
      content: '内容1...',
      ifCollect: false,
    ),
    KnowledgeInfo(
      id: '2',
      cover: 'https://example.com/image2.jpg',
      title: '书法技巧2',
      content: '内容2...',
      ifCollect: true,
    ),
    KnowledgeInfo(
      id: '3',
      cover: 'https://example.com/image3.jpg',
      title: '书法技巧3',
      content: '内容3...',
      ifCollect: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          // 1. 轮播图
          CalligraphyKnowledgePage(knowledgeShow: demoKnowledgeList),

          // 2. 视频区域
          CalligraphyTeachingVideoPage(),

          // 3. 竞赛报名
          CalligraphyCompetitionPage(),
        ],
      ),
    );
  }
}

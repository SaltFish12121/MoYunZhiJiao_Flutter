import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:moyunzhijiao/modules/mainpage/calligraphy_knowledge/calligraphy_knowledge_controller.dart';

class CalligraphyKnowledgePage extends GetView<CalligraphyKnowledgeController> {
  final List<KnowledgeInfo> knowledgeShow;
  // final Function(String) onPushRoute;

  const CalligraphyKnowledgePage({
    Key? key,
    required this.knowledgeShow,
    // required this.onPushRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. 上方提示语
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: InkWell(
            // onTap: () => onPushRoute(
            //     'pages/mainpage/calligraphy_knowledge/CalligraphyKnowledgePage'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '书法知识', // 替换为你的实际字符串资源
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '更多',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),

        // 2. 轮播图
        Container(
          margin: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              final item = knowledgeShow[index];
              return GestureDetector(
                onTap: () {
                  debugPrint(
                      'Selected knowledge: ${item.title}, ${item.cover}');
                  // onPushRoute(
                  //   'pages/mainpage/calligraphy_knowledge/KnowledgeDetailPage',
                  //   extra: {
                  //     'id': item.id,
                  //     'content': item.content,
                  //     'ifCollect': item.ifCollect,
                  //     'title': item.title,
                  //   },
                  // );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    item.cover,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: knowledgeShow.length,
            viewportFraction: 0.8,
            scale: 0.9,
            autoplay: true,
          ),
        ),
      ],
    );
  }
}

// 数据模型
class KnowledgeInfo {
  final String id;
  final String cover;
  final String title;
  final String content;
  final bool ifCollect;

  KnowledgeInfo({
    required this.id,
    required this.cover,
    required this.title,
    required this.content,
    required this.ifCollect,
  });
}

import 'package:get/get.dart';
import 'package:moyunzhijiao/modules/indexed/indexed_controller.dart';
import 'package:moyunzhijiao/modules/indexed/indexed_page.dart';
import 'package:moyunzhijiao/modules/mainpage/calligraphy_competition/calligraphy_competition_controller.dart';
import 'package:moyunzhijiao/modules/mainpage/calligraphy_competition/calligraphy_competition_page.dart';
import 'package:moyunzhijiao/modules/mainpage/calligraphy_teachingVideo/calligraphy_teachingVideo_controller.dart';
import 'package:moyunzhijiao/modules/mainpage/calligraphy_teachingVideo/calligraphy_teachingVideo_page.dart';

import 'route_path.dart';

class AppPages {
  AppPages._(); // 私有构造函数
  static final routes = [
    // 首页
    GetPage(
      name: RoutePath.kIndex,
      page: () => const IndexedPage(),
      bindings: [
        BindingsBuilder.put(() => IndexedController()),
      ],
    ),
    // 书法教学视频
    GetPage(
      name: RoutePath.kCalligraphyTeachingVideo,
      page: () => const CalligraphyTeachingVideoPage(),
      bindings: [
        BindingsBuilder.put(() => CalligraphyTeachingvideoController()),
      ],
    ),
    // 书法竞赛
    GetPage(
      name: RoutePath.kCalligraphyCompetition,
      page: () => const CalligraphyCompetitionPage(),
      bindings: [
        BindingsBuilder.put(() => CalligraphyCompetitionController()),
      ],
    ),
  ];
}

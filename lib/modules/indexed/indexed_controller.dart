import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyunzhijiao/app/constant.dart';
import 'package:moyunzhijiao/app/controller/app_settings_controller.dart';
import 'package:moyunzhijiao/app/event_bus.dart';
import 'package:moyunzhijiao/modules/competition/competition_page.dart';
import 'package:moyunzhijiao/modules/exercise/exercise_page.dart';
import 'package:moyunzhijiao/modules/mainpage/home/home_controller.dart';
import 'package:moyunzhijiao/modules/mainpage/home/home_page.dart';
import 'package:moyunzhijiao/modules/message/message_page.dart';
import 'package:moyunzhijiao/modules/mine/mine_page.dart';

class IndexedController extends GetxController {
  RxList<HomePageItem> items = RxList<HomePageItem>([]);

  var index = 0.obs;
  RxList<Widget> pages = RxList<Widget>([
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ]);

  void setIndex(int i) {
    if (pages[i] is SizedBox) {
      switch (items[i].index) {
        case 0:
          Get.put(HomeController());
          pages[i] = const HomePage();
          break;
        case 1:
          pages[i] = const ExercisePage();
          break;
        case 2:
          pages[i] = const CompetitionPage();
          break;
        case 3:
          pages[i] = const MessagePage();
          break;
        case 4:
          pages[i] = const MinePage();
          break;
        default:
      }
    } else {
      if (index.value == i) {
        EventBus.instance
            .emit<int>(EventBus.kBottomNavigationBarClicked, items[i].index);
      }
    }

    index.value = i;
  }

  @override
  void onInit() {
    // Future.delayed(Duration.zero, showFirstRun);
    items.value = AppSettingsController.instance.homeSort
        .map((key) => Constant.allHomePages[key]!)
        .toList();
    setIndex(0);
    super.onInit();
  }

  void showFirstRun() async {
    var settingsController = Get.find<AppSettingsController>();
    if (settingsController.firstRun) {
      settingsController.setNoFirstRun();
      // await Utils.showStatement();
      // Utils.checkUpdate();
    } else {
      // Utils.checkUpdate();
    }
  }
}

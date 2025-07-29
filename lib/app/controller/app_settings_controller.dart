import 'package:get/get.dart';
import 'package:moyunzhijiao/app/constant.dart';
import 'package:moyunzhijiao/services/local_storage_service.dart';

class AppSettingsController extends GetxController {
  static AppSettingsController get instance =>
      Get.find<AppSettingsController>();

  var firstRun = false;

  @override
  void onInit() {
    // 控制器初始化，加载所有持久化的设置
    firstRun = LocalStorageService.instance
        .getValue(LocalStorageService.kFirstRun, true);
    initHomeSort();
    super.onInit();
  }

  void initHomeSort() {
    // 初始化首页排序
    var sort = LocalStorageService.instance
        .getValue(
          LocalStorageService.kHomeSort,
          Constant.allHomePages.keys.join(","),
        )
        .split(",");
    //如果数量与allSites的数量不一致，将缺失的添加上
    if (sort.length != Constant.allHomePages.length) {
      var keys = Constant.allHomePages.keys.toList();
      for (var i = 0; i < keys.length; i++) {
        if (!sort.contains(keys[i])) {
          sort.add(keys[i]);
        }
      }
    }

    homeSort.value = sort;
  }

  // 首次运行
  void setNoFirstRun() {
    // 标记应用已不是首次运行
    LocalStorageService.instance.setValue(LocalStorageService.kFirstRun, false);
  }

  RxList<String> homeSort = RxList<String>();
  void setHomeSort(List<String> e) {
    // 设置首页排序
    homeSort.value = e;
    LocalStorageService.instance.setValue(
      LocalStorageService.kHomeSort,
      homeSort.join(","),
    );
  }
}

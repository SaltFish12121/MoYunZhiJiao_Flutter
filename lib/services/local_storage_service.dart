import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LocalStorageService extends GetxController {
  static LocalStorageService get instance => Get.find<LocalStorageService>();

  /// 首次运行
  static const String kFirstRun = "FirstRun";

  /// 首页排序
  static const String kHomeSort = "HomeSort";

  late Box settingsBox;
  late Box<String> shieldBox;

  Future init() async {
    settingsBox = await Hive.openBox(
      "LocalStorage",
    );
    shieldBox = await Hive.openBox(
      "DanmuShield",
    );
  }

  T getValue<T>(dynamic key, T defaultValue) {
    try {
      var value = settingsBox.get(key, defaultValue: defaultValue) as T;
      // Log.d("Get LocalStorage：$key\r\n$value");
      return value;
    } catch (e) {
      // Log.logPrint(e);
      return defaultValue;
    }
  }

  Future setValue<T>(dynamic key, T value) async {
    // Log.d("Set LocalStorage：$key\r\n$value");
    return await settingsBox.put(key, value);
  }

  Future removeValue<T>(dynamic key) async {
    // Log.d("Remove LocalStorage：$key");
    return await settingsBox.delete(key);
  }
}

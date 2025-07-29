import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
// import 'package:hive/hive.dart';
import 'package:moyunzhijiao/app/controller/app_settings_controller.dart';
// import 'package:moyunzhijiao/app/app_style.dart';
import 'package:moyunzhijiao/app/utils/listen_fourth_button.dart';
import 'package:moyunzhijiao/modules/debug/debug_log_page.dart';
import 'package:moyunzhijiao/routes/app_pages.dart';
import 'package:moyunzhijiao/routes/route_path.dart';
import 'package:moyunzhijiao/services/local_storage_service.dart';
import 'package:moyunzhijiao/widgets/status/app_loading_widget.dart';
import 'package:window_manager/window_manager.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // 初始化窗口
//   await initWindow();
//   // 初始化服务
//   await initServices();
//   // 启动应用
//   runApp(const MyApp());
// }

void main() async {
  debugPrint('1. 开始初始化');
  // WidgetsFlutterBinding.ensureInitialized();
  debugPrint('2. 基础绑定完成');

  // await initWindow();
  debugPrint('3. 窗口初始化完成');

  await initServices();
  debugPrint('4. 服务初始化完成');

  runApp(const MyApp());
  debugPrint('5. 应用已启动');
}

Future initWindow() async {
  // if (!(Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
  //   return;
  // }
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(280, 280),
    center: true,
    title: "Simple Live",
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

Future initServices() async {
  // Hive.registerAdapter(FollowUserAdapter());
  // Hive.registerAdapter(HistoryAdapter());

  // //包信息
  // Utils.packageInfo = await PackageInfo.fromPlatform();
  //本地存储
  // Log.d("Init LocalStorage Service");
  await Get.put(LocalStorageService()).init();
  // await Get.put(DBService()).init();
  //初始化设置控制器
  Get.put(AppSettingsController());

  // Get.put(BiliBiliAccountService());

  // Get.put(SyncService());

  // Get.put(FollowService());

  // initCoreLog();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "墨韵智教",
      // 路由表
      initialRoute: RoutePath.kIndex,
      getPages: AppPages.routes,
      navigatorObservers: [FlutterSmartDialog.observer], // 路由监听
      builder: FlutterSmartDialog.init(
        // 全局弹窗控制
        loadingBuilder: ((msg) => const AppLoaddingWidget()),
        //字体大小不跟随系统变化
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: Stack(
            children: [
              /* 特殊交互处理 */
              //侧键返回
              RawGestureDetector(
                excludeFromSemantics: true,
                gestures: <Type, GestureRecognizerFactory>{
                  FourthButtonTapGestureRecognizer:
                      GestureRecognizerFactoryWithHandlers<
                          FourthButtonTapGestureRecognizer>(
                    () => FourthButtonTapGestureRecognizer(),
                    (FourthButtonTapGestureRecognizer instance) {
                      instance.onTapDown = (TapDownDetails details) async {
                        //如果处于全屏状态，退出全屏
                        if (!Platform.isAndroid && !Platform.isIOS) {
                          if (await windowManager.isFullScreen()) {
                            await windowManager.setFullScreen(false);
                            return;
                          }
                        }
                        Get.back();
                      };
                    },
                  ),
                },
                child: KeyboardListener(
                  focusNode: FocusNode(),
                  onKeyEvent: (KeyEvent event) async {
                    if (event is KeyDownEvent &&
                        event.logicalKey == LogicalKeyboardKey.escape) {
                      // ESC退出全屏
                      // 如果处于全屏状态，退出全屏
                      if (!Platform.isAndroid && !Platform.isIOS) {
                        if (await windowManager.isFullScreen()) {
                          await windowManager.setFullScreen(false);
                          return;
                        }
                      }
                    }
                  },
                  child: child!,
                ),
              ),

              //查看DEBUG日志按钮
              //只在Debug、Profile模式显示
              Visibility(
                visible: !kReleaseMode,
                child: Positioned(
                  right: 12,
                  bottom: 100 + context.mediaQueryViewPadding.bottom,
                  child: Opacity(
                    opacity: 0.4,
                    child: ElevatedButton(
                      child: const Text("DEBUG LOG"),
                      onPressed: () {
                        Get.bottomSheet(
                          const DebugLogPage(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

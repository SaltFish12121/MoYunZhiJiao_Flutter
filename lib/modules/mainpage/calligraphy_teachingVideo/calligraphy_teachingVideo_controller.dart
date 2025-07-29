import 'package:get/get.dart';
import 'package:moyunzhijiao/models/video_list_model.dart';

class CalligraphyTeachingvideoController extends GetxController {
  // 视频列表数据
  RxList<VideoListInfo> video = <VideoListInfo>[].obs;

  // 加载状态
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchVideos();
  }

  // 获取视频数据
  Future<void> fetchVideos() async {
    try {
      isLoading.value = true;
      // 模拟网络请求获取数据
      await Future.delayed(Duration(seconds: 1));

      // 替换为实际API调用
      // final response = await YourApiService.getTeachingVideos();

      // 模拟数据
      video.assignAll([
        VideoListInfo(
          id: 1,
          title: '楷书基础入门',
          time: '2023-10-01',
          cover: 'https://example.com/video1.jpg',
          type: '',
        ),
        VideoListInfo(
          id: 2,
          title: '行书技巧讲解',
          time: '2023-10-02',
          cover: 'https://example.com/video2.jpg',
          type: '',
        ),
        VideoListInfo(
          id: 3,
          title: '草书创作示范',
          time: '2023-10-03',
          cover: 'https://example.com/video3.jpg',
          type: '',
        ),
      ]);
    } catch (e) {
      Get.snackbar('错误', '加载视频失败: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

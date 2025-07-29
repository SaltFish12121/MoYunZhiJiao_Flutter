import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyunzhijiao/models/video_list_model.dart';
import 'package:moyunzhijiao/modules/mainpage/calligraphy_teachingVideo/calligraphy_teachingVideo_controller.dart';

class CalligraphyTeachingVideoPage
    extends GetView<CalligraphyTeachingvideoController> {
  const CalligraphyTeachingVideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. 上方提示语
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '书法教学视频', // 替换为您的本地化字符串
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/calligraphyTeachingPage');
                    },
                    child: Text(
                      '更多',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              )),
        ),
        const SizedBox(height: 10),

        // 2. 视频展示图
        SizedBox(
          height: 220,
          child: Obx(() => ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 5),
                itemCount:
                    controller.video.length + 1, // +1 for the empty space
                itemBuilder: (context, index) {
                  if (index == controller.video.length) {
                    return const SizedBox(width: 5); // 最后一个空白项
                  }

                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      height: 200,
                      child: VideoItem(video: controller.video[index]),
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }
}

class VideoItem extends StatelessWidget {
  final VideoListInfo video;

  const VideoItem({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   // print('title=${video.title}');
      //   Get.toNamed(
      //     '/teachingVideoDetailPage',
      //     arguments: video,
      //   );
      // },
      child: Container(
        width: double.infinity,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 封面图片
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                video.cover,
                width: double.infinity,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),

            // 标题和时间
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    video.time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600], // 替换为您的 light_black 颜色
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8), // 底部留白
          ],
        ),
      ),
    );
  }
}

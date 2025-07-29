class LabelInfo {
  final String name;

  const LabelInfo(this.name);
}

class VideoInfo {
  final int id; // 视频ID
  final String title; // 标题
  final String time; // 创建时间
  final LabelInfo label; // 标签
  final String intro; // 简介
  final String playTime; // 播放时长
  final int playAmount; // 播放量
  final bool ifCollect; // 是否收藏

  VideoInfo({
    required this.id,
    required this.title,
    required this.time,
    this.label = const LabelInfo(''),
    this.intro = '',
    this.playTime = '',
    this.playAmount = 0,
    this.ifCollect = false,
  });

  // 可选：添加 fromJson 工厂方法以便从 JSON 转换
  factory VideoInfo.fromJson(Map<String, dynamic> json) {
    return VideoInfo(
      id: json['id'],
      title: json['title'],
      time: json['time'],
      label: LabelInfo(json['label'] ?? ''),
      intro: json['intro'] ?? '',
      playTime: json['playTime'] ?? '',
      playAmount: json['playAmount'] ?? 0,
      ifCollect: json['ifCollect'] ?? false,
    );
  }

  // 可选：添加 toJson 方法以便转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'time': time,
      'label': label.name,
      'intro': intro,
      'playTime': playTime,
      'playAmount': playAmount,
      'ifCollect': ifCollect,
    };
  }
}

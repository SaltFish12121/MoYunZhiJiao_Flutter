class VideoListInfo {
  final int id; // 视频ID
  final String type; // 视频类型（是否合集）
  final String title; // 标题
  final String time; // 创建时间
  final dynamic cover; // 封面（使用dynamic以保持与TS的any类型兼容）

  VideoListInfo({
    required this.id,
    required this.type,
    required this.title,
    required this.time,
    required this.cover,
  });

  // 可选：添加 fromJson 工厂方法
  factory VideoListInfo.fromJson(Map<String, dynamic> json) {
    return VideoListInfo(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      time: json['time'],
      cover: json['cover'],
    );
  }

  // 可选：添加 toJson 方法
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'time': time,
      'cover': cover,
    };
  }
}

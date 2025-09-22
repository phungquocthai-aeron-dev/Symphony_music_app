class Singer {
  int singerId;
  String stageName;
  String singerAvatar;
  DateTime createdAt;

  Singer({
    required this.singerId,
    required this.stageName,
    required this.singerAvatar,
    required this.createdAt,
  });

  factory Singer.fromJson(Map<String, dynamic> json) => Singer(
    singerId: json['singer_id'],
    stageName: json['stage_name'],
    singerAvatar: json['singer_avatar'],
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'singer_id': singerId,
    'stage_name': stageName,
    'singer_avatar': singerAvatar,
    'created_at': createdAt.toIso8601String(),
  };
}

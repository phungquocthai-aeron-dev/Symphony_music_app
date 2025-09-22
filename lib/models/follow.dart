class Follow {
  int followId;
  DateTime followAt;

  Follow({required this.followId, required this.followAt});

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
    followId: json['follow_id'],
    followAt: DateTime.parse(json['follow_at']),
  );

  Map<String, dynamic> toJson() => {
    'follow_id': followId,
    'follow_at': followAt.toIso8601String(),
  };
}

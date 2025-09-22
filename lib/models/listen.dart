class Listen {
  int listenId;
  DateTime listenAt;

  Listen({required this.listenId, required this.listenAt});

  factory Listen.fromJson(Map<String, dynamic> json) => Listen(
    listenId: json['listen_id'],
    listenAt: DateTime.parse(json['listen_at']),
  );

  Map<String, dynamic> toJson() => {
    'listen_id': listenId,
    'listen_at': listenAt.toIso8601String(),
  };
}

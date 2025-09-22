class Notification {
  String notificationId;
  String title;
  String message;
  bool isRead;
  DateTime createdAt;

  Notification({
    required this.notificationId,
    required this.title,
    required this.message,
    required this.isRead,
    required this.createdAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    notificationId: json['notification_id'],
    title: json['title'],
    message: json['message'],
    isRead: json['is_read'],
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'notification_id': notificationId,
    'title': title,
    'message': message,
    'is_read': isRead,
    'created_at': createdAt.toIso8601String(),
  };
}

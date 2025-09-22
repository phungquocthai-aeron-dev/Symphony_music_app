class Inbox {
  int inboxId;
  bool isRead;

  Inbox({required this.inboxId, required this.isRead});

  factory Inbox.fromJson(Map<String, dynamic> json) =>
      Inbox(inboxId: json['inbox_id'], isRead: json['is_read']);

  Map<String, dynamic> toJson() => {'inbox_id': inboxId, 'is_read': isRead};
}

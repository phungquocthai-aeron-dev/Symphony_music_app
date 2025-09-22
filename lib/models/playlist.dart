class Playlist {
  int playlistId;
  String playlistName;
  DateTime createdAt;

  Playlist({
    required this.playlistId,
    required this.playlistName,
    required this.createdAt,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
    playlistId: json['playlist_id'],
    playlistName: json['playlist_name'],
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'playlist_id': playlistId,
    'playlist_name': playlistName,
    'created_at': createdAt.toIso8601String(),
  };
}

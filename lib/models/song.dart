class Song {
  int songId;
  String songName;
  String songImg;
  String author;
  int totalListens;
  String lrc;
  String path;
  String lyric;
  DateTime createdAt;
  bool isActive;

  Song({
    required this.songId,
    required this.songName,
    required this.songImg,
    required this.author,
    required this.totalListens,
    required this.lrc,
    required this.path,
    required this.lyric,
    required this.createdAt,
    required this.isActive,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
    songId: json['song_id'],
    songName: json['song_name'],
    songImg: json['song_img'],
    author: json['author'],
    totalListens: json['total_listens'],
    lrc: json['lrc'],
    path: json['path'],
    lyric: json['lyric'],
    createdAt: DateTime.parse(json['created_at']),
    isActive: json['is_active'],
  );

  Map<String, dynamic> toJson() => {
    'song_id': songId,
    'song_name': songName,
    'song_img': songImg,
    'author': author,
    'total_listens': totalListens,
    'lrc': lrc,
    'path': path,
    'lyric': lyric,
    'created_at': createdAt.toIso8601String(),
    'is_active': isActive,
  };
}

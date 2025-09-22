class Album {
  int albumId;
  String albumName;
  String albumImg;
  DateTime releaseDate;

  Album({
    required this.albumId,
    required this.albumName,
    required this.albumImg,
    required this.releaseDate,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    albumId: json['album_id'],
    albumName: json['album_name'],
    albumImg: json['album_img'],
    releaseDate: DateTime.parse(json['release_date']),
  );

  Map<String, dynamic> toJson() => {
    'album_id': albumId,
    'album_name': albumName,
    'album_img': albumImg,
    'release_date': releaseDate.toIso8601String(),
  };
}

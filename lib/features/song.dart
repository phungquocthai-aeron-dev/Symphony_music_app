import 'package:flutter/material.dart';
import '../models/song.dart';

class SongScreen extends StatelessWidget {
  final Song song;

  const SongScreen({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(song.songName)),
      body: Center(child: Text('Đây là trang bài hát: ${song.songName}')),
    );
  }
}

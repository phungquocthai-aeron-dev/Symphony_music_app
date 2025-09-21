import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/song.dart';

class MusicPlayerProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Song? _currentSong;
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  List<Song> _playlist = [];
  int _currentIndex = 0;
  bool _isShuffle = false;
  bool _isRepeat = false;
  bool _isLoading = false;

  // Getters
  Song? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;
  Duration get currentPosition => _currentPosition;
  Duration get totalDuration => _totalDuration;
  List<Song> get playlist => _playlist;
  int get currentIndex => _currentIndex;
  bool get isShuffle => _isShuffle;
  bool get isRepeat => _isRepeat;
  double get progress => _totalDuration.inMilliseconds > 0
      ? _currentPosition.inMilliseconds / _totalDuration.inMilliseconds
      : 0.0;

  MusicPlayerProvider() {
    _initAudioPlayer();
    _loadDemoPlaylist();
  }

  void _initAudioPlayer() {
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      _isPlaying = state == PlayerState.playing;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((Duration position) {
      _currentPosition = position;
      notifyListeners();
    });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      _totalDuration = duration;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      if (_isRepeat) {
        _playCurrentSong();
      } else {
        nextSong();
      }
    });
  }

  void _loadDemoPlaylist() {
    _playlist = [
      Song(
        songId: 1,
        songName: "Người Âm Phủ",
        songImg: "assets/song_images/nguoiamphu.jpg",
        author: "OSAD, VRT",
        totalListens: 1000,
        lrc: "assets/lrc/nguoiamphu.lrc",
        path: "assets/music/nguoiamphu.mp3",
        lyric: "assets/lyrics/nguoiamphu.lrc",
        createdAt: DateTime.now().subtract(Duration(days: 30)),
        isActive: true,
      ),

      Song(
        songId: 2,
        songName: "Thằng Điên",
        songImg: "assets/song_images/thangdien.jpg",
        author: "JustaTee",
        totalListens: 2500,
        lrc: "assets/lrc/thangdien.lrc",
        path: "assets/music/thangdien.mp3",
        lyric: "assets/lyrics/thangdien.lrc",
        createdAt: DateTime.now().subtract(Duration(days: 15)),
        isActive: true,
      ),

      Song(
        songId: 3,
        songName: "Thịnh Vượng Việt Nam Sáng Ngời",
        songImg: "assets/song_images/thinhvuongvietnamsangngoi.jpg",
        author: "Bùi Trường Linh",
        totalListens: 800,
        lrc: "assets/lrc/thinhvuongvietnamsangngoi.lrc",
        path: "assets/music/thinhvuongvietnamsangngoi.mp3",
        lyric: "assets/lyrics/thinhvuongvietnamsangngoi.lrc",
        createdAt: DateTime.now().subtract(Duration(days: 7)),
        isActive: true,
      ),

      Song(
        songId: 4,
        songName: "Hoa Cỏ Lau",
        songImg: "assets/song_images/hoacolau.jpg",
        author: "Phong Max",
        totalListens: 800,
        lrc: "assets/lrc/hoacolau.lrc",
        path: "assets/music/hoacolau.mp3",
        lyric: "assets/lyrics/hoacolau.lrc",
        createdAt: DateTime.now().subtract(Duration(days: 7)),
        isActive: true,
      ),

      Song(
        songId: 5,
        songName: "Thanh Xuân",
        songImg: "assets/song_images/thanhxuan.jpg",
        author: "DALAB",
        totalListens: 800,
        lrc: "assets/lrc/thanhxuan.lrc",
        path: "assets/music/thanhxuan.mp3",
        lyric: "assets/lyrics/thanhxuan.lrc",
        createdAt: DateTime.now().subtract(Duration(days: 7)),
        isActive: true,
      ),

      Song(
        songId: 6,
        songName: "Pháo Hồng",
        songImg: "assets/song_images/phaohong.jpg",
        author: "Đạt Long Vinh",
        totalListens: 1200,
        lrc: "assets/lrc/phaohong.lrc",
        path: "assets/music/phaohong.mp3",
        lyric: "assets/lyrics/phaohong.lrc",
        createdAt: DateTime.now().subtract(Duration(days: 5)),
        isActive: true,
      ),

      Song(
        songId: 7,
        songName: "Lối Nhỏ",
        songImg: "assets/song_images/loinho.jpg",
        author: "Đen Vâu",
        totalListens: 900,
        lrc: "assets/lrc/loinho.lrc",
        path: "assets/music/loinho.mp3",
        lyric: "assets/lyrics/loinho.lrc",
        createdAt: DateTime.now().subtract(Duration(days: 4)),
        isActive: true,
      ),

      Song(
        songId: 8,
        songName: "Tinh Vệ",
        songImg: "assets/song_images/tinhve.jpg",
        author: "MIKC",
        totalListens: 1500,
        lrc: "assets/lrc/tinhve.lrc",
        path: "assets/music/tinhve.mp3",
        lyric: "assets/lyrics/tinhve.lrc",
        createdAt: DateTime.now().subtract(Duration(days: 3)),
        isActive: true,
      ),

      Song(
        songId: 9,
        songName: "Nevada",
        songImg: "assets/song_images/nevada.jpg",
        author: "Vicetone",
        totalListens: 2000,
        lrc: "assets/lrc/nevada.lrc",
        path: "assets/music/nevada.mp3",
        lyric: "assets/lyrics/nevada.lrc",
        createdAt: DateTime.now().subtract(Duration(days: 2)),
        isActive: true,
      ),

      Song(
        songId: 10,
        songName: "Đã Lỡ Yêu Em Nhiều",
        songImg: "assets/song_images/daloyeuemnhieu.jpg",
        author: "JustaTee",
        totalListens: 2500,
        lrc: "assets/lrc/daloyeuemnhieu.lrc",
        path: "assets/music/daloyeuemnhieu.mp3",
        lyric: "assets/lyrics/daloyeuemnhieu.lrc",
        createdAt: DateTime.now().subtract(Duration(days: 1)),
        isActive: true,
      ),
    ];
  }

  // Cập nhật toàn bộ playlist mới
  // autoPlayFirst nếu true thì tự động phát bài đầu tiên trong playlist mới
  void updatePlaylist(List<Song> newPlaylist, {bool autoPlayFirst = false}) {
    _playlist = newPlaylist;
    _currentIndex = 0;
    _currentSong = _playlist.isNotEmpty ? _playlist[0] : null;
    notifyListeners();

    if (autoPlayFirst && _currentSong != null) {
      _playCurrentSong();
    }
  }

  Future<void> playSong(Song song) async {
    try {
      int index = _playlist.indexWhere((s) => s.songId == song.songId);

      if (index != -1) {
        _currentIndex = index;
      } else {
        _playlist.insert(0, song);
        _currentIndex = 0;
      }

      _currentSong = song;

      await _playCurrentSong();
      notifyListeners();
    } catch (e) {
      print('Error playing song: $e');
    }
  }

  Future<void> _playCurrentSong() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      if (_currentSong != null) {
        String audioPath = _currentSong!.path;
        await _audioPlayer.stop();

        if (audioPath.startsWith('http')) {
          await _audioPlayer.play(UrlSource(audioPath));
        } else if (audioPath.startsWith('assets/')) {
          String assetPath = audioPath.replaceFirst('assets/', '');
          if (_audioPlayer.state == PlayerState.stopped ||
              _audioPlayer.state == PlayerState.paused) {
            await _audioPlayer.play(AssetSource(assetPath));
          }
        } else {
          await _audioPlayer.play(DeviceFileSource(audioPath));
        }
      }
    } finally {
      _isLoading = false;
    }
  }

  Future<void> togglePlayPause() async {
    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        if (_currentSong != null) {
          await _audioPlayer.resume();
        }
      }
    } catch (e) {
      print('Error toggle play/pause: $e');
    }
  }

  Future<void> nextSong() async {
    if (_playlist.isEmpty) return;

    if (_isShuffle) {
      _currentIndex = (_currentIndex + 1) % _playlist.length;
    } else {
      _currentIndex = (_currentIndex + 1) % _playlist.length;
    }

    _currentSong = _playlist[_currentIndex];
    await _playCurrentSong();
  }

  Future<void> previousSong() async {
    if (_playlist.isEmpty) return;

    _currentIndex = (_currentIndex - 1) < 0
        ? _playlist.length - 1
        : _currentIndex - 1;

    _currentSong = _playlist[_currentIndex];
    await _playCurrentSong();
  }

  Future<void> seekTo(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void toggleShuffle() {
    _isShuffle = !_isShuffle;
    notifyListeners();
  }

  void toggleRepeat() {
    _isRepeat = !_isRepeat;
    notifyListeners();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}

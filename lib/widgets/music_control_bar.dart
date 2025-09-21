import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symphony_music_app/core/constants.dart';
import '../providers/music_player_provider.dart';

class MusicControlBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, musicProvider, child) {
        final song = musicProvider.currentSong;

        // Hông có bài hát thì hông hiển thị
        if (song == null) {
          return SizedBox.shrink();
        }

        return SafeArea(
          top: false,
          child: Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: AppColors.darkGreyColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Thông tin bài hát và điều khiển
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 4,
                      right: 10,
                      bottom: 0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Album art
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: song.songImg.isNotEmpty
                                ? DecorationImage(
                                    image: AssetImage(song.songImg),
                                    fit: BoxFit.cover,
                                    onError: (_, __) {},
                                  )
                                : null,
                            color: Colors.grey[300],
                          ),
                          child: song.songImg.isEmpty
                              ? Icon(Icons.music_note, color: Colors.grey[600])
                              : null,
                        ),
                        SizedBox(width: 12),

                        // Thông tin bài hát
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                song.songName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                song.author,
                                style: TextStyle(
                                  color: AppColors.textDarkThemeColor,
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),

                        // Thời gian
                        // Text(
                        //   '${musicProvider.formatDuration(musicProvider.currentPosition)} / ${musicProvider.formatDuration(musicProvider.totalDuration)}',
                        //   style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                        // ),
                        // SizedBox(width: 8),

                        // Điều khiển phát nhạc
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.skip_previous, size: 20),
                              onPressed: musicProvider.previousSong,
                              padding: EdgeInsets.all(4),
                              color: AppColors.textDarkThemeColor,
                            ),
                            IconButton(
                              icon: Icon(
                                musicProvider.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: 24,
                              ),
                              onPressed: musicProvider.togglePlayPause,
                              padding: EdgeInsets.all(4),
                              color: AppColors.textDarkThemeColor,
                            ),
                            IconButton(
                              icon: Icon(Icons.skip_next, size: 20),
                              onPressed: musicProvider.nextSong,
                              padding: EdgeInsets.all(4),
                              color: AppColors.textDarkThemeColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Thanh tiến trình có thể kéo
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.primaryColor,
                    inactiveTrackColor: Colors.grey[500],
                    thumbColor: AppColors.primaryColor,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 12),
                    trackHeight: 2,
                  ),
                  child: Slider(
                    value: musicProvider.progress.clamp(0.0, 1.0),
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 2,
                      right: 10,
                      bottom: 0,
                    ),
                    onChanged: (value) {
                      final duration = musicProvider.totalDuration;
                      final position = Duration(
                        milliseconds: (duration.inMilliseconds * value).round(),
                      );
                      musicProvider.seekTo(position);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

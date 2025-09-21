import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/music_player_provider.dart';
import 'package:symphony_music_app/core/constants.dart';

class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, musicProvider, child) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Music',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: musicProvider.playlist.length,
                  itemBuilder: (context, index) {
                    final song = musicProvider.playlist[index];
                    final isCurrentSong =
                        musicProvider.currentSong?.songId == song.songId;

                    return ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: song.songImg.isNotEmpty
                              ? DecorationImage(
                                  image: AssetImage(song.songImg),
                                  fit: BoxFit.cover,
                                  onError: (_, __) {},
                                )
                              : null,
                          color: Colors.blue[100],
                        ),
                        child: song.songImg.isEmpty
                            ? Icon(
                                Icons.music_note,
                                color: AppColors.primaryColor,
                              )
                            : (isCurrentSong && musicProvider.isPlaying)
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.volume_up,
                                  color: Colors.white,
                                ),
                              )
                            : null,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          // Truyền song vào arguments
                          Navigator.pushNamed(
                            context,
                            '/song',
                            arguments: song,
                          );
                        },
                        child: Text(
                          song.songName,
                          style: TextStyle(
                            fontWeight: isCurrentSong
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isCurrentSong
                                ? AppColors.primaryColor
                                : AppColors.textDarkThemeColor,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(song.author),
                          Text(
                            '${song.totalListens} lượt nghe',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        isCurrentSong && musicProvider.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onTap: () {
                        if (isCurrentSong) {
                          musicProvider.togglePlayPause();
                        } else {
                          musicProvider.playSong(song);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

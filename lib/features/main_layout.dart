import 'package:flutter/material.dart';
import 'package:symphony_music_app/features/playlist.dart';
import 'package:symphony_music_app/features/search_screen.dart';
import 'package:symphony_music_app/features/song.dart';
import 'package:symphony_music_app/models/song.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/music_control_bar.dart';
import '../features/library.dart';
import 'example.dart';

class MainLayout extends StatefulWidget {
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Nội dung chính, đặt dưới AppBar
          Positioned.fill(
            top: 100,
            child: Navigator(
              key: _navigatorKey,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/library':
                    return MaterialPageRoute(builder: (_) => LibraryScreen());
                  case '/playlist':
                    return MaterialPageRoute(builder: (_) => PlaylistScreen());
                  case '/search':
                    return MaterialPageRoute(builder: (_) => SearchScreen());
                  case '/song':
                    final songArg = settings.arguments;
                    if (songArg == null || songArg is! Song) {
                      return MaterialPageRoute(
                        builder: (_) => Scaffold(
                          appBar: AppBar(title: Text('Song')),
                          body: Center(child: Text('No song selected')),
                        ),
                      );
                    }
                    final Song song = songArg;
                    return MaterialPageRoute(
                      builder: (_) => SongScreen(song: song),
                    );
                  case '/home':
                  default:
                    return MaterialPageRoute(builder: (_) => ExampleScreen());
                }
              },
            ),
          ),

          Positioned(top: 0, left: 0, right: 0, child: CustomAppBar()),

          Positioned(left: 0, right: 0, bottom: 60, child: MusicControlBar()),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
                switch (index) {
                  case 0:
                    _navigatorKey.currentState?.pushNamed('/home');
                    break;
                  case 1:
                    _navigatorKey.currentState?.pushNamed('/search');
                    break;
                  case 2:
                    _navigatorKey.currentState?.pushNamed('/library');
                    break;
                  case 3:
                    _navigatorKey.currentState?.pushNamed('/playlist');
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

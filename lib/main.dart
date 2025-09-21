import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/main_layout.dart';
import 'providers/music_player_provider.dart';
import 'package:symphony_music_app/core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // ThemeMode chung cho toàn app
  static final ValueNotifier<ThemeMode> themeMode = ValueNotifier(
    ThemeMode.light,
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MusicPlayerProvider())],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeMode,
        builder: (context, mode, _) {
          return MaterialApp(
            title: 'Symphony',
            theme: AppTheme.darkTheme,
            darkTheme: AppTheme.lightTheme,
            themeMode: mode,
            home: MainLayout(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

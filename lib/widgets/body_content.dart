import 'package:flutter/material.dart';
import '../features/example.dart';
import '../features/search_screen.dart';
import '../features/library.dart';
import '../features/favorite.dart';

class BodyContent extends StatelessWidget {
  final int currentIndex;

  const BodyContent({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return ExampleScreen();
      case 1:
        return SearchScreen();
      case 2:
        return LibraryScreen();
      case 3:
        return FavoriteScreen();
      default:
        return ExampleScreen();
    }
  }
}

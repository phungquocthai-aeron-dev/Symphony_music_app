import 'package:flutter/material.dart';
import 'package:symphony_music_app/core/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.lightGreyColor,
      backgroundColor: AppColors.blackColor.withAlpha((0.7 * 255).round()),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Tìm kiếm'),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music),
          label: 'Thư viện',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Yêu thích',
        ),
      ],
    );
  }
}

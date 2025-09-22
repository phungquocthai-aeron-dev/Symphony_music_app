import 'package:flutter/material.dart';
import 'package:symphony_music_app/core/constants.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.blackColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Avatar người dùng
              CircleAvatar(
                radius: 17,
                backgroundImage: AssetImage(
                  'assets/user_avatars/user_avatar.jpg',
                ),
                backgroundColor: Colors.grey[300],
              ),
              SizedBox(width: 12),

              // Tên app
              Text(
                'App music',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

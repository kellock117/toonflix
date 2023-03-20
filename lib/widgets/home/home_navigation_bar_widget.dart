import 'package:flutter/material.dart';

class HomeNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.green,
      title: const Text(
        "오늘의 웹툰",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

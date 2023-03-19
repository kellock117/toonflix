import 'package:flutter/material.dart';

import '../widgets/home_body_widget.dart';
import '../widgets/navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(
        title: "오늘의 웹툰",
      ),
      body: HomeBodyWidget(),
    );
  }
}

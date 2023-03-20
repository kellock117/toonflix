import 'package:flutter/material.dart';

import '../widgets/home/home_body_widget.dart';
import '../widgets/home/home_navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeNavigationBar(),
      body: HomeBodyWidget(),
    );
  }
}

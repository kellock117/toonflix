import 'package:flutter/material.dart';

import '../widgets/detail/detail_episodes_widget.dart';
import '../widgets/detail/detail_information_widget.dart';
import '../widgets/detail/detail_navigation_bar_widget.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailNavigationBar(
        title: title,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DetailInformationWidget(
                thumb: thumb,
                id: id,
              ),
              DetailEpisodesWidget(
                id: id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

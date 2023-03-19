import 'package:flutter/material.dart';

import '../widgets/detail_episodes_widget.dart';
import '../widgets/detail_information_widget.dart';
import '../widgets/navigation_bar_widget.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title: title,
      ),
      body: Column(
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
    );
  }
}

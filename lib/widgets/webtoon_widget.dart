import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';
import '../models/webtoon_model.dart';
import './image_widget.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  Webtoon({super.key, required WebtoonModel webtoon})
      : title = webtoon.title,
        thumb = webtoon.thumb,
        id = webtoon.id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(title: title, thumb: thumb, id: id),
              ),
            );
          },
          child: ImageWidget(
            thumb: thumb,
            id: id,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}

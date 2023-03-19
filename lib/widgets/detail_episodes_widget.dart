import 'package:flutter/material.dart';

import 'package:toonflix/services/api_service.dart';

import '../models/webtoon_episode_model.dart';

class DetailEpisodesWidget extends StatefulWidget {
  final String id;
  const DetailEpisodesWidget({super.key, required this.id});

  @override
  State<DetailEpisodesWidget> createState() => _DetailEpisodesWidgetState();
}

class _DetailEpisodesWidgetState extends State<DetailEpisodesWidget> {
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    episodes = ApiService.getLatestEpisodesbyId(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: episodes,
      builder: (context, snapshot) {
        
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return 
      },
      );
      },
    );
  }
}

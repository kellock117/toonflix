import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);
    List<WebtoonModel> webtoonList = [];

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (Map<String, dynamic> webtoon in webtoons) {
        webtoonList.add(WebtoonModel.fromJson(webtoon));
      }

      return webtoonList;
    } else {
      throw Error();
    }
  }

  static Future<WebtoonDetailModel> getToonbyId(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    } else {
      throw Error();
    }
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesbyId(
      String id) async {
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    List<WebtoonEpisodeModel> episodesList = [];

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (Map<String, dynamic> episode in episodes) {
        episodesList.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesList;
    } else {
      throw Error();
    }
  }
}

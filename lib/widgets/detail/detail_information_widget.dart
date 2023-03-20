import 'package:flutter/material.dart';

import 'package:toonflix/widgets/image_widget.dart';
import '../../models/webtoon_detail_model.dart';
import '../../services/api_service.dart';

class DetailInformationWidget extends StatefulWidget {
  final String thumb, id;

  const DetailInformationWidget({
    super.key,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailInformationWidget> createState() => _DetailBodyWidgetState();
}

class _DetailBodyWidgetState extends State<DetailInformationWidget> {
  late Future<WebtoonDetailModel> webtoon;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonbyId(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageWidget(
          thumb: widget.thumb,
        ),
        FutureBuilder(
          future: webtoon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    snapshot.data!.about,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        snapshot.data!.genre,
                      ),
                      Text(
                        ' / ${snapshot.data!.age}',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            } else {
              return const Text("...");
            }
          },
        ),
      ],
    );
  }
}

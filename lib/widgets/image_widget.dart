import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String thumb, id;

  const ImageWidget({
    super.key,
    required this.thumb,
    this.id = '0',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: id,
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.5)),
                ]),
            child: Image.network(
              thumb,
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailNavigationBar extends StatefulWidget
    implements PreferredSizeWidget {
  final String title;
  const DetailNavigationBar({
    super.key,
    required this.title,
  });

  @override
  State<DetailNavigationBar> createState() => _DetailNavigationBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _DetailNavigationBarState extends State<DetailNavigationBar> {
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList("likedToons");

    if (likedToons != null && likedToons.contains(widget.title)) {
      setState(() {
        isLiked = true;
      });
    } else {
      await prefs.setStringList('likedToons', <String>[]);
    }
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  onClick() async {
    final likedToons = prefs.getStringList('likedToons');

    if (isLiked) {
      likedToons!.remove(widget.title);
    } else {
      likedToons!.add(widget.title);
    }
    await prefs.setStringList('likedToons', likedToons);
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.green,
      actions: [
        IconButton(
          onPressed: onClick,
          icon: isLiked
              ? const Icon(
                  Icons.favorite_outlined,
                )
              : const Icon(
                  Icons.favorite_outline_outlined,
                ),
        ),
      ],
      title: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

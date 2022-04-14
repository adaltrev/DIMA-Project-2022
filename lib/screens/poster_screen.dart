import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PosterScreen extends StatefulWidget {
  const PosterScreen({Key? key}) : super(key: key);
  static const routeName = '/poster';

  @override
  State<PosterScreen> createState() => _PosterScreenState();
}

class _PosterScreenState extends State<PosterScreen> {
  @override
  Widget build(BuildContext context) {
    final poster = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(title: const Text("Poster")),
        body: Center(
          child: CachedNetworkImage(
            imageUrl: "http://image.tmdb.org/t/p/w342" + poster,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ));
  }
}

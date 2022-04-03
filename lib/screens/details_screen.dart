import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/serie.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final serie = ModalRoute.of(context)!.settings.arguments as Serie;
    return Scaffold(
      appBar: AppBar(title: Text(serie.name)),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: "http://image.tmdb.org/t/p/w342" + serie.posterPath,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text(
              serie.overview,
            )
          ]),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/Serie.dart';

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
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl:
                          "http://image.tmdb.org/t/p/w342" + serie.posterPath,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Genre: " + serie.genre),
                      Text("Country: " + serie.country),
                      Text("Status: " + serie.status),
                      Text(serie.totalSeasons.toString() +
                          " seasons, " +
                          serie.totalEpisodes.toString() +
                          " episodes"),
                      Text("First aired: " + serie.beginDate),
                      Text("Last aired: " + serie.endDate)
                    ],
                  )
                ],
              ),
              Text(
                serie.overview,
              )
            ]),
      ),
    );
  }
}

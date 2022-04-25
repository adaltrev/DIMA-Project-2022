import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/screens/poster_screen.dart';
import 'package:dima_project/widgets/seasons_pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/serie.dart';
import '../model/series.dart';
import 'add_series_screen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Series>(context);

    final serie = ModalRoute.of(context)!.settings.arguments as Serie;
    return Scaffold(
      appBar: AppBar(title: Text(serie.name)),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () => {
                      Navigator.pushNamed(context, PosterScreen.routeName,
                          arguments: serie.posterPath)
                    },
                    icon: CachedNetworkImage(
                      height: 300,
                      width: 200,
                      imageUrl:
                          "http://image.tmdb.org/t/p/w342" + serie.posterPath,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    constraints: const BoxConstraints(
                      minHeight: 300,
                      minWidth: 200,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        IconButton(
                            onPressed: () => {
                                  Navigator.pushNamed(
                                      context, AddScreen.routeName,
                                      arguments: serie)
                                },
                            icon: const Icon(Icons.add_circle))
                      ]),
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
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                serie.overview,
              ),
              SeasonsPages(serie)
            ]),
      ),
    );
  }
}

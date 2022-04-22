import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/serie.dart';

class WatchingDetailsScreen extends StatefulWidget {
  const WatchingDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/watching_details';

  @override
  State<WatchingDetailsScreen> createState() => _WatchingDetailsScreenState();
}

class _WatchingDetailsScreenState extends State<WatchingDetailsScreen> {
  int selectedCard = 0;
  //I use this to higligth the season that I'm currently watching when opening the app
  bool firstBuild = true;

  updateSelectedCard(int newSelectedCardIndex) {
    setState(() {
      selectedCard = newSelectedCardIndex;
    });
  }

  addEpisode(Serie serie, int quantity) {
    setState(() {
      selectedCard = serie.addEpisodes(selectedCard, quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    final serie = ModalRoute.of(context)!.settings.arguments as Serie;
    if (firstBuild) {
      updateSelectedCard(serie.currentlyWatchingSeason());
      firstBuild = false;
    }
    return Scaffold(
      appBar: AppBar(title: Text(serie.name)),
      body: Column(
        children: [
          const Text("Seasons"),
          Container(
            height: 350,
            child: GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.21 / 2,
              children: [
                ...serie.seasons.map((season) {
                  var index = serie.seasons.indexOf(season);
                  return GestureDetector(
                    onTap: () {
                      updateSelectedCard(index);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: selectedCard == index ? 8 : 0,
                          color: Colors.grey,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl: "http://image.tmdb.org/t/p/w185" +
                                    season.posterPath,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              if (season.completed()) ...[
                                Positioned.fill(
                                  child: Container(
                                    color: Colors.black38,
                                  ),
                                ),
                                const Icon(
                                  Icons.check_circle_sharp,
                                  color: Colors.green,
                                  size: 30,
                                ),
                              ]
                            ],
                          ),
                        ),
                        Text("Season $index",
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  );
                }).toList()
              ],
            ),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => addEpisode(serie, -5),
                  icon: const Icon(
                    Icons.keyboard_double_arrow_left_sharp,
                    color: Colors.black,
                    size: 45,
                  )),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => addEpisode(serie, -1),
                  icon: const Icon(
                    Icons.keyboard_arrow_left_rounded,
                    color: Colors.black,
                    size: 45,
                  )),
              Text(
                serie.seasonWatchingEpisode(selectedCard).toString() +
                    "/" +
                    serie.seasonTotalEpisodes(selectedCard).toString(),
                style: const TextStyle(fontSize: 30),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => addEpisode(serie, 1),
                  icon: const Icon(
                    Icons.keyboard_arrow_right_sharp,
                    color: Colors.black,
                    size: 45,
                  )),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => addEpisode(serie, 5),
                  icon: const Icon(
                    Icons.keyboard_double_arrow_right_sharp,
                    color: Colors.black,
                    size: 45,
                  ))
            ],
          ),
          Text("currently watching " +
              serie.currentlyWatchingSeason().toString()),
          Text("selected $selectedCard"),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

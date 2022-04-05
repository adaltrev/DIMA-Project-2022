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

  @override
  Widget build(BuildContext context) {
    final serie = ModalRoute.of(context)!.settings.arguments as Serie;
    if (firstBuild) {
      updateSelectedCard(serie.currentlyWatching());
      firstBuild = false;
    }
    return Scaffold(
      appBar: AppBar(title: Text(serie.name)),
      body: Column(
        children: [
          Text("Seasons"),
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
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: selectedCard == index ? 10 : 0,
                      color: Colors.grey,
                      child: Stack(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: "http://image.tmdb.org/t/p/w185" +
                                      season.posterPath,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                Text("Season $index",
                                    style: TextStyle(color: Colors.white)),
                              ]),
                          if (season.completed()) ...[
                            Center(
                              child: Container(
                                color: Colors.black38,
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.check_circle_sharp,
                                color: Colors.green,
                                size: 30,
                              ),
                            )
                          ]
                        ],
                      ),
                    ),
                  );
                }).toList()
              ],
            ),
          ),
          const Spacer(),
          Text("currently watching " + serie.currentlyWatching().toString()),
          Text("selected $selectedCard"),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

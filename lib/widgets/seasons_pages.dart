import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/model/categories.dart';
import 'package:dima_project/widgets/adder_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/serie.dart';

class SeasonsPages extends StatefulWidget {
  final Serie serie;

  const SeasonsPages(this.serie, {Key? key}) : super(key: key);

  @override
  State<SeasonsPages> createState() => _SeasonsPagesState();
}

class _SeasonsPagesState extends State<SeasonsPages> {
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
    if (firstBuild) {
      updateSelectedCard(widget.serie.currentlyWatchingSeason());
      firstBuild = false;
    }
    return Column(
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
              ...widget.serie.seasons.map((season) {
                var index = widget.serie.seasons.indexOf(season);
                return GestureDetector(
                  onTap: () {
                    updateSelectedCard(index);
                  },
                  //elevation: selectedCard == index ? 8 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: CachedNetworkImage(
                                imageUrl: "http://image.tmdb.org/t/p/w185" +
                                    season.posterPath,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
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
                      Text(
                        "Season ${index + 1}",
                        style: TextStyle(
                            color: selectedCard == index
                                ? Theme.of(context).primaryColor
                                : Colors.white),
                      )
                    ],
                  ),
                );
              }).toList()
            ],
          ),
        ),
        //if I'm searching the series hide the tools to update watching episodes
        if (widget.serie.category != Categories.searched) ...[
          AdderBar(widget.serie, addEpisode, selectedCard),
          SizedBox(
            height: 5.h,
          )
        ]
      ],
    );
  }
}

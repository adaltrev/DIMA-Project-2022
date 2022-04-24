import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                        "Season $index",
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => addEpisode(widget.serie, -5),
                icon: Icon(
                  FontAwesomeIcons.backwardFast,
                  size: 8.w,
                )),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => addEpisode(widget.serie, -1),
                icon: Icon(
                  FontAwesomeIcons.backwardStep,
                  size: 8.w,
                )),
            Text(
              widget.serie.seasonWatchingEpisode(selectedCard).toString() +
                  " · " +
                  widget.serie.seasonTotalEpisodes(selectedCard).toString(),
              style: const TextStyle(fontSize: 30),
            ),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => addEpisode(widget.serie, 1),
                icon: Icon(
                  FontAwesomeIcons.forwardStep,
                  size: 8.w,
                )),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => addEpisode(widget.serie, 5),
                icon: Icon(
                  FontAwesomeIcons.forwardFast,
                  size: 8.w,
                ))
          ],
        ),
        SizedBox(
          height: 5.h,
        )
      ],
    );
  }
}

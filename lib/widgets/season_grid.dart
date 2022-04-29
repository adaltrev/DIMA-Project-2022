import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/season.dart';

class SeasonGrid extends StatelessWidget {
  final List<Season> seasons;
  final Function updateSelectedCard;
  var selectedCard;

  SeasonGrid(
    this.seasons,
    this.updateSelectedCard,
    this.selectedCard, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 3,
        children: [
          ...seasons.map((season) {
            var index = seasons.indexOf(season);
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
    );
  }
}

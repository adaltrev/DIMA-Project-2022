import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/model/categories.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/season.dart';

class SeasonGrid extends StatelessWidget {
  final List<Season> seasons;
  final Function updateSelectedCard;
  final Categories status;
  var selectedCard;

  SeasonGrid(
    this.seasons,
    this.updateSelectedCard,
    this.selectedCard,
    this.status, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 3,
        children: [
          ...seasons.map((season) {
            var index = season.number - 1;
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
                                CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (season.completed()) ...[
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Container(color: Colors.black38),
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
                        color: selectedCard == index &&
                                status == Categories.watching
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).shadowColor),
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

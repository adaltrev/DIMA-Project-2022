import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/screens/watching_details_screen.dart';
import 'package:flutter/material.dart';

import '../model/serie.dart';

class WatchingListItem extends StatelessWidget {
  WatchingListItem(this.serie, this.goToDetails);

  final Serie serie;
  Function goToDetails;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          goToDetails(serie);
        },
        child: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "http://image.tmdb.org/t/p/w342" + serie.posterPath,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Flexible(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(serie.name),
                        Text("Season " +
                            serie.currentlyWatchingSeason().toString()),
                        Text("Episode " +
                            serie
                                .seasonWatchingEpisode(
                                    serie.currentlyWatchingSeason())
                                .toString()),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}

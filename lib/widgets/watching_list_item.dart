import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/screens/watching_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import '../model/serie.dart';
import 'package:dima_project/asset/text_styles.dart';

class WatchingListItem extends StatelessWidget {
  WatchingListItem(this.serie, this.goToDetails, this.updateEpisode);

  final Serie serie;
  Function goToDetails;
  Function updateEpisode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          goToDetails(serie);
        },
        child: Card(
          margin: EdgeInsets.fromLTRB(2.w, 1.w, 2.w, 1.w),
          child: Padding(
            padding: EdgeInsets.fromLTRB(2.w, 2.w, 2.w, 2.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: CachedNetworkImage(
                    imageUrl:
                        "http://image.tmdb.org/t/p/w342" + serie.posterPath,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Flexible(
                    flex: 5,
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(3.w, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            serie.name,
                            style: Theme.of(context).textTheme.cardText1,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 2.w, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Season " +
                                      (serie.currentlyWatchingSeason() + 1)
                                          .toString(),
                                  style: Theme.of(context).textTheme.cardText2,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Episode ",
                                      style:
                                          Theme.of(context).textTheme.cardText2,
                                    ),
                                    Text(
                                      serie
                                          .seasonWatchingEpisode(
                                              serie.currentlyWatchingSeason())
                                          .toString(),
                                      style:
                                          Theme.of(context).textTheme.cardText2,
                                    ),
                                    Text(
                                      "/",
                                      style:
                                          Theme.of(context).textTheme.cardText2,
                                    ),
                                    Text(
                                      serie
                                          .seasonTotalEpisodes(
                                              serie.currentlyWatchingSeason())
                                          .toString(),
                                      style:
                                          Theme.of(context).textTheme.cardText2,
                                    ),
                                  ],
                                ),
                                Text(
                                  "Last seen: 3 days ago ",
                                  style: Theme.of(context).textTheme.cardText2,
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    //I use inkwell because I had issues with icon button
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () => updateEpisode(serie, 1),
                                      child: Icon(
                                        Icons.add,
                                        size: 13.w,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}

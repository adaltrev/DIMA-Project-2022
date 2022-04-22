import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/screens/watching_details_screen.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
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
        child: Card(
          color: Color.fromARGB(79, 3, 167, 243),
          elevation: 5,
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
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(3.w, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            serie.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.copyWith(fontSize: 20.sp),
                          ),
                          Text(
                            "Season " +
                                serie.currentlyWatchingSeason().toString(),
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            "Watched " +
                                serie
                                    .seasonWatchingEpisode(
                                        serie.currentlyWatchingSeason())
                                    .toString(),
                            style: Theme.of(context).textTheme.bodyText2,
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/screens/watching_details_screen.dart';
import 'package:flutter/material.dart';

import '../model/serie.dart';

class WatchingListItem extends StatelessWidget {
  const WatchingListItem(this.serie, {Key? key}) : super(key: key);

  final Serie serie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          WatchingDetailsScreen.routeName,
          //TODO pass id
          arguments: serie,
        );
      },
      child: Card(
        child: ListTile(
          leading: CachedNetworkImage(
            imageUrl: "http://image.tmdb.org/t/p/w342" + serie.posterPath,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          title: Text(serie.name),
          subtitle: Text(serie.beginDate),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/screens/details_screen.dart';
import 'package:flutter/material.dart';

import '../model/serie.dart';

class ListItem extends StatelessWidget {
  const ListItem(this.serie, {Key? key}) : super(key: key);

  final Serie serie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          DetailsScreen.routeName,
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

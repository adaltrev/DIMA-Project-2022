import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/screens/details_screen.dart';
import 'package:flutter/material.dart';

import '../model/serie.dart';

class ListItem extends StatelessWidget {
  const ListItem(this.serie, this.updateState, {Key? key}) : super(key: key);

  final Serie serie;
  final Function updateState;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(
              DetailsScreen.routeName,
              arguments: serie,
            )
            .then((_) => updateState());
      },
      child: Card(
        child: ListTile(
          leading: CachedNetworkImage(
            imageUrl: "http://image.tmdb.org/t/p/w342" + serie.posterPath,
            placeholder: (context, url) => CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          title: Text(serie.name),
          subtitle: Text(serie.beginDate),
        ),
      ),
    );
  }
}

import 'package:dima_project/screens/details_screen.dart';
import 'package:flutter/material.dart';

import '../model/serie.dart';

class ListItem extends StatelessWidget {
  final Serie serie;

  const ListItem(this.serie, {Key? key}) : super(key: key);
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
          leading: Image.network(serie.imgUrl),
          title: Text(serie.title),
          subtitle: Text(serie.year),
        ),
      ),
    );
  }
}

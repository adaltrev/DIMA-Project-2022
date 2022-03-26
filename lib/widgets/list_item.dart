import 'package:flutter/material.dart';

import '../model/Serie.dart';

class ListItem extends StatelessWidget {
  final Serie serie;

  const ListItem(this.serie, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(serie.imgUrl),
        title: Text(serie.title),
        subtitle: Text(serie.year),
      ),
    );
  }
}

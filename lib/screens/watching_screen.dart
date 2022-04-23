import 'package:dima_project/screens/watching_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/serie.dart';
import '../model/series.dart';
import '../widgets/list_item.dart';
import '../widgets/watching_list_item.dart';

class WatchingScreen extends StatefulWidget {
  const WatchingScreen({Key? key}) : super(key: key);

  @override
  State<WatchingScreen> createState() => _WatchingScreenState();
}

class _WatchingScreenState extends State<WatchingScreen> {
  void goToDetails(Serie serie) {
    Navigator.of(context)
        .pushNamed(
          WatchingDetailsScreen.routeName,
          //TODO pass id
          arguments: serie,
        )
        .then((_) => setState(() {}));
  }

  void updateEpisode(Serie serie, quantity) {
    setState(() {
      serie.addEpisodes(serie.currentlyWatchingSeason(), quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    final series = Provider.of<Series>(context);
    final completed = series.watchingSeries;

    return Container(
      alignment: Alignment.center,
      child: ListView(children: [
        ...completed.map((serie) {
          return WatchingListItem(serie, goToDetails, updateEpisode);
        }).toList()
      ]),
    );
  }
}

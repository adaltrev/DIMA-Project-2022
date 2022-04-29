import 'package:cached_network_image/cached_network_image.dart';
import '../model/serie.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/seasons_pages.dart';

class WatchingDetailsScreen extends StatefulWidget {
  const WatchingDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/watching_details';

  @override
  State<WatchingDetailsScreen> createState() => _WatchingDetailsScreenState();
}

class _WatchingDetailsScreenState extends State<WatchingDetailsScreen> {
  int selectedCard = 0;
  //I use this to higligth the season that I'm currently watching when opening the app
  bool firstBuild = true;

  updateSelectedCard(int newSelectedCardIndex) {
    setState(() {
      selectedCard = newSelectedCardIndex;
    });
  }

  addEpisode(Serie serie, int quantity) {
    setState(() {
      selectedCard = serie.addEpisodes(selectedCard, quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    final serie = ModalRoute.of(context)!.settings.arguments as Serie;
    if (firstBuild) {
      updateSelectedCard(serie.currentlyWatchingSeason());
      firstBuild = false;
    }
    return Scaffold(
      appBar: AppBar(title: Text(serie.name)),
      body: SeasonsPages(serie),
    );
  }
}

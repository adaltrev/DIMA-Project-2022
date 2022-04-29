import '../model/serie.dart';
import 'package:dima_project/model/categories.dart';
import 'package:dima_project/widgets/adder_bar.dart';
import 'package:dima_project/widgets/season_grid.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SeasonsPages extends StatefulWidget {
  final Serie serie;

  const SeasonsPages(this.serie, {Key? key}) : super(key: key);

  @override
  State<SeasonsPages> createState() => _SeasonsPagesState();
}

class _SeasonsPagesState extends State<SeasonsPages> {
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
    if (firstBuild) {
      updateSelectedCard(widget.serie.currentlyWatchingSeason());
      firstBuild = false;
    }
    return Column(
      children: [
        const Text("Seasons"),
        SeasonGrid(widget.serie.seasonsSublisted(8)[0], updateSelectedCard,
            selectedCard),
        //if I'm searching the series hide the tools to update watching episodes
        if (widget.serie.category != Categories.searched) ...[
          AdderBar(widget.serie, addEpisode, selectedCard),
          SizedBox(
            height: 5.h,
          )
        ]
      ],
    );
  }
}

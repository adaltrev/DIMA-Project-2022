import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/serie.dart';

class AdderBar extends StatelessWidget {
  final Serie serie;
  final Function addEpisode;
  int selectedCard;

  AdderBar(this.serie, this.addEpisode, this.selectedCard, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => addEpisode(serie, -5),
            icon: Icon(
              FontAwesomeIcons.backwardFast,
              size: 8.w,
            )),
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => addEpisode(serie, -1),
            icon: Icon(
              FontAwesomeIcons.backwardStep,
              size: 8.w,
            )),
        Text(
          serie.seasonWatchingEpisode(selectedCard).toString() +
              " · " +
              serie.seasonTotalEpisodes(selectedCard).toString(),
          style: const TextStyle(fontSize: 30),
        ),
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => addEpisode(serie, 1),
            icon: Icon(
              FontAwesomeIcons.forwardStep,
              size: 8.w,
            )),
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => addEpisode(serie, 5),
            icon: Icon(
              FontAwesomeIcons.forwardFast,
              size: 8.w,
            ))
      ],
    );
    ;
  }
}

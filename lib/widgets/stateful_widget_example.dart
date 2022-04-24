import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/serie.dart';

class EpisodeAdderBar extends StatefulWidget {
  final Serie serie;
  final Function addEpisode;
  int selectedCard;

  EpisodeAdderBar(this.serie, this.addEpisode, this.selectedCard, {Key? key})
      : super(key: key);

  @override
  State<EpisodeAdderBar> createState() => _EpisodeAdderBarState();
}

class _EpisodeAdderBarState extends State<EpisodeAdderBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => widget.addEpisode(widget.serie, -5),
            icon: Icon(
              FontAwesomeIcons.backwardFast,
              size: 8.w,
            )),
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => widget.addEpisode(widget.serie, -1),
            icon: Icon(
              FontAwesomeIcons.backwardStep,
              size: 8.w,
            )),
        Text(
          widget.serie.seasonWatchingEpisode(widget.selectedCard).toString() +
              " · " +
              widget.serie.seasonTotalEpisodes(widget.selectedCard).toString(),
          style: const TextStyle(fontSize: 30),
        ),
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => widget.addEpisode(widget.serie, 1),
            icon: Icon(
              FontAwesomeIcons.forwardStep,
              size: 8.w,
            )),
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => widget.addEpisode(widget.serie, 5),
            icon: Icon(
              FontAwesomeIcons.forwardFast,
              size: 8.w,
            ))
      ],
    );
  }
}

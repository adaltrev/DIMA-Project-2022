import '../model/serie.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RowButton extends StatelessWidget {
  final Serie serie;

  addEpisode(Serie serie, int quantity) {
    serie.addEpisodes(serie.currentlyWatchingSeason(), quantity);
  }

  const RowButton({Key? key, required this.serie}) : super(key: key);

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
          serie
                  .seasonWatchingEpisode(serie.currentlyWatchingSeason())
                  .toString() +
              " · " +
              serie
                  .seasonWatchingEpisode(serie.currentlyWatchingSeason())
                  .toString(),
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
  }
}

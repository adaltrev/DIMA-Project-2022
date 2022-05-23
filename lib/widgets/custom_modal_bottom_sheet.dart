import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../db.dart';
import '../model/categories.dart';
import '../model/serie.dart';
import '../model/series.dart';

class CustomBottomModalSheet extends StatefulWidget {
  Serie serie;

  CustomBottomModalSheet(this.serie, {Key? key}) : super(key: key);

  @override
  State<CustomBottomModalSheet> createState() => _CustomBottomModalSheetState();
}

class _CustomBottomModalSheetState extends State<CustomBottomModalSheet> {
  var seriesStatus;
  var season;
  var episode;

  @override
  void initState() {
    seriesStatus = getStatus(widget.serie.category);
    season = widget.serie.currentlyWatchingSeason() + 1;
    episode =
        widget.serie.seasons[widget.serie.currentlyWatchingSeason()].number;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Series>(context);
    return Container(
      height: 40.h,
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              const Text("Status: "),
              DropdownButton<String>(
                value: seriesStatus,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    seriesStatus = newValue!;
                  });
                },
                items: <String>['Watching', 'Completed', 'Plan to watch']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: [
              const Text("Current Season: "),
              DropdownButton<int>(
                value: season,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: seriesStatus == "Watching"
                    ? (int? newValue) {
                        setState(() {
                          season = newValue!;
                        });
                      }
                    : null,
                items: widget.serie.seasons.map<DropdownMenuItem<int>>((e) {
                  return DropdownMenuItem<int>(
                    value: e.number,
                    child: Text(e.number.toString()),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: [
              const Text("Watched Episodes: "),
              //Menù a tendina per l'episodio attuale (solo stato watching)
              DropdownButton<int>(
                value: episode,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: seriesStatus == "Watching"
                    ? (int? newValue) {
                        setState(() {
                          episode = newValue!;
                          //non c'e bisogno di questo pezzo già viene fatto automaticamente
                          // if (season == widget.serie.totalSeasons &&
                          //     episode == widget.serie.seasons[season - 1].episodes) {
                          //   status = "Completed";
                          // }
                        });
                      }
                    : null,
                items: List<int>.generate(
                    widget.serie.seasons[season - 1].episodes + 1,
                    (index) => index).map<DropdownMenuItem<int>>((e) {
                  return DropdownMenuItem<int>(
                    value: e,
                    child: Text(e.toString()),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () => {
                        if (widget.serie.category == Categories.searched)
                          {db.addSerie(widget.serie)},
                        if (seriesStatus == "Watching")
                          {
                            widget.serie.changeCategory(Categories.watching),
                            widget.serie.completeSeasons(season - 1),
                            widget.serie.emptySeasons(season - 2),
                            widget.serie.addEpisodes(season - 1, episode)
                          }
                        else if (seriesStatus == "Completed")
                          {
                            widget.serie.changeCategory(Categories.completed),
                            widget.serie
                                .completeSeasons(widget.serie.totalSeasons)
                          }
                        else if (seriesStatus == "Plan to watch")
                          {
                            widget.serie.changeCategory(Categories.wishlist),
                            widget.serie.emptySeasons(-1)
                          },
                        Navigator.pop(context)
                      },
                  child: widget.serie.category == Categories.searched
                      ? const Text("Add to list")
                      : const Text("Edit")),
              TextButton(
                  onPressed: widget.serie.category == Categories.searched
                      ? null
                      : () => {
                            widget.serie.changeCategory(Categories.searched),
                            db.removeSeries(widget.serie.id),
                            deleteSeries(
                                widget.serie.id, widget.serie.totalSeasons),
                            Navigator.pop(context)
                          },
                  child: widget.serie.category == Categories.searched
                      ? const Text("")
                      : const Text("Remove from list",
                          style: TextStyle(color: Colors.red)))
            ],
          )
        ],
      ),
    );
  }
}

getStatus(Categories category) {
  if (category == Categories.completed) {
    return "Completed";
  } else if (category == Categories.wishlist) {
    return "Plan to watch";
  } else if (category == Categories.searched) {
    return "Watching";
  } else if (category == Categories.watching) {
    return "Watching";
  }
}

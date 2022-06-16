import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dima_project/asset/text_styles.dart';

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
        widget.serie.seasons[widget.serie.currentlyWatchingSeason()].watched;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Series>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5.w),
      ),
      height: 30.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Status:",
                      style: Theme.of(context).textTheme.modalSheetText,
                    ),
                    const Spacer(),
                    DropdownButton<String>(
                      key: const ValueKey("statusDropdown"),
                      value: seriesStatus,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: Theme.of(context)
                          .textTheme
                          .modalSheetText
                          .copyWith(color: Theme.of(context).shadowColor),
                      underline: Container(
                        height: 2,
                        color: Theme.of(context).primaryColor,
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
                    Text("Season:",
                        style: Theme.of(context).textTheme.modalSheetText),
                    const Spacer(),
                    DropdownButton<int>(
                      value: season,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: Theme.of(context)
                          .textTheme
                          .modalSheetText
                          .copyWith(color: Theme.of(context).shadowColor),
                      underline: Container(
                        height: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                      onChanged: seriesStatus == "Watching"
                          ? (int? newValue) {
                              setState(() {
                                season = newValue!;
                              });
                            }
                          : null,
                      items:
                          widget.serie.seasons.map<DropdownMenuItem<int>>((e) {
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
                    Text("Watched Episodes:",
                        style: Theme.of(context).textTheme.modalSheetText),
                    const Spacer(),
                    //Menù a tendina per l'episodio attuale (solo stato watching)
                    DropdownButton<int>(
                      value: episode,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: Theme.of(context)
                          .textTheme
                          .modalSheetText
                          .copyWith(color: Theme.of(context).shadowColor),
                      underline: Container(
                        height: 2,
                        color: Theme.of(context).primaryColor,
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
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
            child: Row(
              children: [
                TextButton(
                    onPressed: widget.serie.category == Categories.searched
                        ? null
                        : () => {
                              widget.serie.changeCategory(Categories.searched),
                              db.removeSeries(widget.serie.id),
                              deleteSeries(
                                  widget.serie.id, widget.serie.totalSeasons),
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Series removed from your list."),
                              )),
                              Navigator.pop(context)
                            },
                    child: widget.serie.category == Categories.searched
                        ? const Text("")
                        : Text("Remove from list",
                            style: Theme.of(context)
                                .textTheme
                                .modalSheetTextBig
                                .copyWith(color: Colors.red))),
                const Spacer(),
                TextButton(
                    onPressed: () => {
                          if (widget.serie.category == Categories.searched)
                            {
                              db.addSerie(widget.serie),
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Series added to your list!"),
                              )),
                            }
                          else
                            {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Series status updated."),
                              )),
                            },
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
                        ? Text(
                            "Add to list",
                            key: const ValueKey("addToList"),
                            style: Theme.of(context)
                                .textTheme
                                .modalSheetTextBig
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
                          )
                        : Text(
                            "Edit",
                            style: Theme.of(context)
                                .textTheme
                                .modalSheetTextBig
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
                          )),
              ],
            ),
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

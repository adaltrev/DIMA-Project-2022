import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/screens/poster_screen.dart';
import 'package:dima_project/widgets/seasons_pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/categories.dart';
import '../model/series.dart';
import '../widgets/custom_modal_bottom_sheet.dart';
import 'add_series_screen.dart';
import '../model/serie.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Series>(context);

    final serie = ModalRoute.of(context)!.settings.arguments as Serie;

    return Scaffold(
      appBar: AppBar(title: Text(serie.name)),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, PosterScreen.routeName,
                        arguments: serie.posterPath)
                  },
                  icon: CachedNetworkImage(
                    imageUrl:
                        "http://image.tmdb.org/t/p/w342" + serie.posterPath,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  constraints: BoxConstraints(
                    minHeight: 69.w,
                    minWidth: 46.w,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      IconButton(
                          onPressed: () => {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomBottomModalSheet(serie);
                                  },
                                ).then((_) => setState(() {}))
                              },
                          icon: serie.category == Categories.searched
                              ? const Icon(Icons.add_circle)
                              : const Icon(Icons.edit_note))
                    ]),
                    Text("Genre: " + serie.genre),
                    Text("Country: " + serie.country),
                    Text("Status: " + serie.status),
                    Text(serie.totalSeasons.toString() +
                        " seasons, " +
                        serie.totalEpisodes.toString() +
                        " episodes"),
                    Text("First aired: " + serie.beginDate),
                    Text("Last aired: " + serie.endDate)
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(2.w, 0, 1.w, 2.h),
            child: Text(
              serie.overview,
            ),
          ),
          SeasonsPages(serie)
        ]),
      ),
    );
  }
}

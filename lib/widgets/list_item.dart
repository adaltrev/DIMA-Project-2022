import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/asset/text_styles.dart';
import 'package:dima_project/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/serie.dart';

class ListItem extends StatelessWidget {
  const ListItem(this.serie, this.updateState, {Key? key}) : super(key: key);

  final Serie serie;
  final Function updateState;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(
              DetailsScreen.routeName,
              arguments: serie,
            )
            .then((_) => updateState());
      },
      child: SizedBox(
        height: 24.w,
        child: Card(
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                SizedBox(
                    height: 24.w,
                    width: 16.w,
                    child: CachedNetworkImage(
                      imageUrl:
                          "http://image.tmdb.org/t/p/w342" + serie.posterPath,
                      placeholder: (context, url) => CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )),
                Padding(
                  padding: EdgeInsets.all(1.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        serie.name,
                        style: Theme.of(context).textTheme.cardText3,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.w),
                        child: Text(
                          serie.beginDate.substring(0, 4),
                          style: Theme.of(context).textTheme.cardText4.copyWith(
                              color: Theme.of(context).secondaryHeaderColor),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

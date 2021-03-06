import 'package:dima_project/model/series.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../db.dart';
import '../model/season.dart';
import '../model/serie.dart';
import '../model/theme_model.dart';
import '../screens/browse_screen.dart';
import '../screens/search_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, VoidCallback tapHandler) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My TV Tracker',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Theme.of(context).primaryColor),
                ),
                IconButton(
                  icon: Icon(
                      theme.isDark ? Icons.nightlight_round : Icons.wb_sunny),
                  onPressed: () {
                    theme.isDark ? theme.isDark = false : theme.isDark = true;
                  },
                  iconSize: 8.w,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile('My List', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Search', () {
            Navigator.of(context).pushReplacementNamed(SearchScreen.routeName);
          }),
          buildListTile('Browse', () {
            Navigator.of(context).pushReplacementNamed(BrowseScreen.routeName);
          })
          /*buildListTile('DB test', () async {
            commitData(Provider.of<Series>(context, listen: false).series);
            Future<List<Serie>> resp = loadData();
            final r = await resp;
            for (Serie i in r) {
              print(i.id.toString() +
                  ": " +
                  i.name +
                  " (" +
                  i.category.toString() +
                  ")");
              for (Season s in i.seasons) {
                print("Season " +
                    s.number.toString() +
                    ": " +
                    s.watched.toString() +
                    "/" +
                    s.episodes.toString());
              }
            }
          }),
          buildListTile('DB reset', () {
            deleteDB();
          }),
          buildListTile('DB load', () async {
            final db = Provider.of<Series>(context, listen: false);
            db.initSeries();
          })*/
        ],
      ),
    );
  }
}

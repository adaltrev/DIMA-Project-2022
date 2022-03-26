import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/serie.dart';
import '../model/categories.dart';
import '../model/series.dart';
import '../widgets/main_drawer.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);
  static const routeName = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    Serie DUMMY_SERIE = Serie(
        "Hunter x Hunter",
        "1999",
        "Duis magna amet irure eu ullamco culpa id est elit qui. Cillum eiusmod sint ea esse est aute. Nostrud amet voluptate elit non pariatur eu consequat dolore. Consequat officia ipsum cupidatat cillum commodo mollit in consectetur non aliqua consectetur ipsum.",
        Categories.watching,
        "https://www.animeclick.it/immagini/anime/Hunter_x_Hunter_2011/cover/Hunter_x_Hunter_2011-cover.jpg");

    final series = Provider.of<Series>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search screen"),
      ),
      drawer: MainDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          child: Text("Add a serie"),
          onPressed: () => series.addSerie(DUMMY_SERIE),
        ),
      ),
    );
  }
}

import 'dart:ffi';
import 'package:dima_project/model/serie.dart';
import 'package:dima_project/screens/details_screen.dart';
import 'package:http/http.dart' as http;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/model/tv_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/season.dart';
import '../model/serie.dart';
import '../model/categories.dart';
import '../model/series.dart';
import '../widgets/main_drawer.dart';
import '../api.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const routeName = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Result> _results = [];
  String _query = "";

  void _updateSearch() async {
    List<TvSearch> jsonResults = await searchByName(_query);
    List<Result> results = [];
    for (var item in jsonResults) {
      results.add(Result(id: item.id, posterPath: item.posterPath));
    }
    setState(() {
      _results = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search screen"),
        ),
        drawer: const MainDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextField(
                        textAlign: TextAlign.start,
                        showCursor: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Search TV series"),
                        onEditingComplete: _updateSearch,
                        onChanged: (x) => _query = x,
                        maxLength: 50,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ))),
                IconButton(
                  onPressed: _updateSearch,
                  icon: const Icon(Icons.search),
                  tooltip: 'Search TV series',
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: _results,
              ),
            )
          ],
        ));
  }
}

class Result extends StatelessWidget {
  const Result({Key? key, required this.id, required this.posterPath})
      : super(key: key);

  final String posterPath;
  final int id;

  @override
  Widget build(BuildContext context) {
    Serie res;
    return IconButton(
      onPressed: (() async => {
            res = await findById(id.toString()),
            Navigator.pushNamed(context, DetailsScreen.routeName,
                arguments: res)
          }),
      icon: CachedNetworkImage(
        height: 300,
        width: 200,
        imageUrl: "http://image.tmdb.org/t/p/w342" + posterPath,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

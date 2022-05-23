import 'dart:ffi';
import 'package:dima_project/screens/details_screen.dart';
import 'package:http/http.dart' as http;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/model/tv_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          title: Container(
            width: double.infinity,
            height: 30.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _updateSearch();
                        FocusManager.instance.primaryFocus?.unfocus();
                        _controller.clear();
                      },
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                      ),
                      tooltip: 'Search TV series',
                    ),
                    hintText: 'Search TV series',
                    border: InputBorder.none),
                onSubmitted: (text) {
                  _updateSearch();
                  _controller.clear();
                },
                onChanged: (x) => _query = x,
              ),
            ),
          ),
        ),
        drawer: const MainDrawer(),
        body: GestureDetector(
          onTapDown: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: _results,
                ),
              )
            ],
          ),
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
        placeholder: (context, url) => CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

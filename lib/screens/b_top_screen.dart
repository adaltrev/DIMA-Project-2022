import 'dart:ffi';
import 'package:dima_project/db.dart';
import 'package:dima_project/screens/details_screen.dart';
import 'package:dima_project/screens/search_screen.dart';
import 'package:dima_project/model/tv_search.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/search_screen_status.dart';
import '../widgets/main_drawer.dart';
import '../api.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({Key? key}) : super(key: key);
  static const routeName = '/top_rated';

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  SearchScreenStatus pageStatus = SearchScreenStatus.showingSuggested;
  List<Result> _results = [];

  @override
  void initState() {
    _updateSearch();
    super.initState();
  }

  void _updateSearch() async {
    setState(() {
      pageStatus = SearchScreenStatus.loading;
    });
    List<TvSearch> jsonResults = await browse("top_rated");
    List<Result> results = [];
    for (var item in jsonResults) {
      results.add(Result(id: item.id, posterPath: item.posterPath));
    }
    setState(() {
      _results = results;
      setState(() {
        pageStatus = SearchScreenStatus.showingList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        body: (() {
          if (pageStatus == SearchScreenStatus.showingList) {
            return GestureDetector(
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
                      crossAxisCount: 3,
                      //quando ne mostro 2
                      //mainAxisSpacing: (0.5).w,
                      //crossAxisSpacing: 2.w,
                      childAspectRatio: 2 / 3,
                      children: _results,
                    ),
                  )
                ],
              ),
            );
          } else if (pageStatus == SearchScreenStatus.loading) {
            return Center(
              child: SizedBox(
                width: 20.w,
                height: 20.w,
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          } else {
            return GestureDetector(
                onTapDown: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                    color: Theme.of(context).canvasColor,
                    height: double.infinity,
                    width: double.infinity,
                    child: const Center(child: Text("Top Rated Shows"))));
          }
        }()));
  }
}

import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:dima_project/db.dart';
import 'package:dima_project/screens/details_screen.dart';
import 'package:http/http.dart' as http;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dima_project/model/tv_search.dart';

import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/search_screen_status.dart';
import '../model/season.dart';
import '../model/serie.dart';
import '../model/categories.dart';
import '../model/series.dart';
import '../widgets/main_drawer.dart';
import '../api.dart';
import 'b_latest_screen.dart';
import 'b_popular_screen.dart';
import 'b_top_screen.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key}) : super(key: key);
  static const routeName = '/browse';

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen>
    with WidgetsBindingObserver {
  SearchScreenStatus pageStatus = SearchScreenStatus.showingSuggested;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state.toString());
    if (state == AppLifecycleState.paused) {
      commitData(Provider.of<Series>(context, listen: false).series);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).primaryColor,
            tabs: const <Widget>[
              Tab(
                text: 'Popular',
              ),
              Tab(
                text: 'Top Rated',
              ),
              Tab(
                text: 'Latest',
              ),
            ],
          ),
        ),
        drawer: const MainDrawer(),
        body: const TabBarView(
          children: <Widget>[
            PopularScreen(),
            TopScreen(),
            LatestScreen(),
          ],
        ),
      ),
    );
  }
}

import 'package:dima_project/asset/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/series.dart';
import './completed_screen.dart';
import './wishlist_screen.dart';
import './watching_screen.dart';
import '../widgets/main_drawer.dart';
import '../db.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      // initialIndex: 0,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu, size: 7.w),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
          title: TabBar(
            indicatorColor: Theme.of(context).errorColor,
            labelColor: Theme.of(context).errorColor,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Watching',
                  style: Theme.of(context).textTheme.tabBarLabel,
                ),
              ),
              Tab(
                child: Text(
                  'Completed',
                  style: Theme.of(context).textTheme.tabBarLabel,
                ),
              ),
              Tab(
                child: Text(
                  'Wishlist',
                  style: Theme.of(context).textTheme.tabBarLabel,
                ),
              ),
            ],
          ),
        ),
        drawer: MainDrawer(),
        body: const TabBarView(
          children: <Widget>[
            WatchingScreen(),
            CompletedScreen(),
            WishlistScreen(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import './completed_screen.dart';
import './wishlist_screen.dart';
import './watching_screen.dart';
import '../widgets/main_drawer.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My List'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Watching',
              ),
              Tab(
                text: 'Completed',
              ),
              Tab(
                text: 'Wishlist',
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
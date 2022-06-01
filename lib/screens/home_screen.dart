import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class _ListScreenState extends State<ListScreen> with WidgetsBindingObserver {
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

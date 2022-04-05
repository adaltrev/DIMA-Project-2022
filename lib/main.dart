import 'package:dima_project/screens/details_screen.dart';
import 'package:dima_project/screens/watching_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/search_screen.dart';
import 'screens/home_screen.dart';
import './model/series.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Series(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ListScreen(),
        initialRoute: '/',
        routes: {
          SearchScreen.routeName: (ctx) => SearchScreen(),
          DetailsScreen.routeName: (ctx) => DetailsScreen(),
          WatchingDetailsScreen.routeName: (ctx) => WatchingDetailsScreen()
        },
      ),
    );
  }
}

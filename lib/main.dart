import 'package:dima_project/screens/details_screen.dart';
import 'package:dima_project/screens/poster_screen.dart';
import 'package:dima_project/screens/watching_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
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
            textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87),
              headline2: TextStyle(fontWeight: FontWeight.bold),
              bodyText2: TextStyle(color: Colors.black38),
              caption: TextStyle(fontFamily: 'Hind'),
            )),
        home: ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return const ListScreen();
          },
        ),
        initialRoute: '/',
        routes: {
          SearchScreen.routeName: (ctx) => const SearchScreen(),
          DetailsScreen.routeName: (ctx) => const DetailsScreen(),
          WatchingDetailsScreen.routeName: (ctx) =>
              const WatchingDetailsScreen(),
          PosterScreen.routeName: (ctx) => const PosterScreen()
        },
      ),
    );
  }
}

import 'package:dima_project/asset/text_styles.dart';
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
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
            primaryColor: Colors.teal,
            brightness: Brightness.dark,
            canvasColor: Color.fromARGB(255, 18, 18, 18),
            cardColor: Color.fromARGB(255, 40, 40, 40),
            shadowColor: Colors.white),
        theme: ThemeData.light(),
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

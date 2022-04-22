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
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Colors.red,
              onPrimary: Color.fromARGB(255, 193, 193, 189),
              secondary: Colors.blue,
              onSecondary: Colors.teal,
              background: Colors.black,
              onBackground: Colors.deepPurple,
              error: Colors.lime,
              onError: Colors.lime,
              surface: Color.fromARGB(255, 0, 191, 16),
              onSurface: Colors.lime),
        ),
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

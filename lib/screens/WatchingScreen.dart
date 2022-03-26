import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/Series.dart';
import '../widgets/list_item.dart';

class WatchingScreen extends StatefulWidget {
  const WatchingScreen({Key? key}) : super(key: key);

  @override
  State<WatchingScreen> createState() => _WatchingScreenState();
}

class _WatchingScreenState extends State<WatchingScreen> {
  @override
  Widget build(BuildContext context) {
    final series = Provider.of<Series>(context);
    final completed = series.watchingSeries;

    return Container(
      alignment: Alignment.center,
      child: ListView(children: [
        ...completed.map((serie) {
          return ListItem(serie);
        }).toList()
      ]),
    );
  }
}

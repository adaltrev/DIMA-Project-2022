import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/series.dart';
import '../widgets/list_item.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    final series = Provider.of<Series>(context);
    var completed = series.completedSeries;
    updateState() {
      setState(() {});
    }

    return Container(
      alignment: Alignment.center,
      child: ListView(children: [
        ...completed.map((serie) {
          return ListItem(serie, updateState);
        }).toList()
      ]),
    );
  }
}

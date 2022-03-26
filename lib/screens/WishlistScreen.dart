import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/Series.dart';
import '../widgets/list_item.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final series = Provider.of<Series>(context);
    final completed = series.wishlistSeries;

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

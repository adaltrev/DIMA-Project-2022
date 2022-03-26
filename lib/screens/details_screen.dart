import 'package:flutter/material.dart';

import '../model/serie.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final serie = ModalRoute.of(context)!.settings.arguments as Serie;
    return Scaffold(
      appBar: AppBar(title: Text(serie.title)),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              serie.imgUrl,
              height: 400,
              fit: BoxFit.fitHeight,
            ),
            Text(
              serie.description,
            )
          ]),
    );
  }
}

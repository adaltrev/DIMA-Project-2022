import 'package:dima_project/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';

import 'SearchScreen.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my list"),
      ),
      drawer: MainDrawer(),
    );
  }
}

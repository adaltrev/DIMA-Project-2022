import 'package:flutter/material.dart';

class WatchingScreen extends StatefulWidget {
  const WatchingScreen({Key? key}) : super(key: key);

  @override
  State<WatchingScreen> createState() => _WatchingScreenState();
}

class _WatchingScreenState extends State<WatchingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text("watching"),
    );
  }
}

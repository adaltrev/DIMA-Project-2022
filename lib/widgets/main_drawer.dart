import 'package:flutter/material.dart';

import '../screens/search_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, VoidCallback tapHandler) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Nome App?',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile('My List', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Search', () {
            Navigator.of(context).pushReplacementNamed(SearchScreen.routeName);
          }),
        ],
      ),
    );
  }
}

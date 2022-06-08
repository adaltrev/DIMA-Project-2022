import 'dart:async';

import 'package:dima_project/model/categories.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'model/season.dart';
import 'model/serie.dart';

//Returns list of all series/seasons data stored in the local database, corresponding to User's personal series list
Future<List<Serie>> loadData() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final status = prefs.getBool('exists') ?? false;

  final database = openDatabase(
    join(await getDatabasesPath(), 'my_list.db'),
  );

  final db = await database;
  if (status == false) {
    db.execute(
      'CREATE TABLE series(id INTEGER PRIMARY KEY, name TEXT, posterPath TEXT, genre TEXT, country TEXT, overview TEXT, beginDate TEXT, endDate TEXT, status TEXT, totalSeasons INTEGER, totalEpisodes INTEGER, category TEXT)',
    );
    db.execute(
        'CREATE TABLE season(series_id INTEGER NOT NULL, number INTEGER NOT NULL, posterPath TEXT, airDate TEXT, episodes INTEGER, watched INTEGER, PRIMARY KEY (series_id, number))');
    prefs.setBool('exists', true);
  }

  List<Serie> my_list = [];
  final List<Map<String, dynamic>> db_series = await db.query('series');

  for (var item in db_series) {
    List<Season> my_seasons = [];
    final List<Map<String, dynamic>> db_season = await db
        .query('season', where: 'series_id = ?', whereArgs: [item['id']]);

    for (var season in db_season) {
      my_seasons.add(Season(
          number: season['number'],
          posterPath: season['posterPath'],
          airDate: season['airDate'],
          episodes: season['episodes'],
          watched: season['watched']));
    }

    Categories category = Categories.watching;
    switch (item['category']) {
      case "Categories.watching":
        category = Categories.watching;
        break;
      case "Categories.completed":
        category = Categories.completed;
        break;
      case "Categories.wishlist":
        category = Categories.wishlist;
        break;
      case "Categories.searched":
        category = Categories.searched;
        break;
      default:
    }

    my_list.add(Serie(
        id: item['id'],
        name: item['name'],
        posterPath: item['posterPath'],
        beginDate: item['beginDate'],
        endDate: item['endDate'],
        genre: item['genre'],
        country: item['country'],
        overview: item['overview'],
        status: item['status'],
        totalEpisodes: item['totalEpisodes'],
        totalSeasons: item['totalSeasons'],
        seasons: my_seasons,
        category: category));
  }

  return my_list;
}

void commitSeries(Serie serie) async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final status = prefs.getBool('exists') ?? false;

  final database = openDatabase(
    join(await getDatabasesPath(), 'my_list.db'),
    version: 1,
  );

  final db = await database;

  if (status == true) {
    db.insert('series', serie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    for (Season item in serie.seasons) {
      Map<String, dynamic> s = item.toMap();
      s['series_id'] = serie.id;
      db.insert('season', s, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }
}

//Remove a series and all its seasons from local db
void deleteSeries(int id, int seasons) async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final status = prefs.getBool('exists') ?? false;

  final database = openDatabase(
    join(await getDatabasesPath(), 'my_list.db'),
    version: 1,
  );

  final db = await database;

  if (status == true) {
    for (int i = 1; i < seasons; i++) {
      db.delete('season',
          where: 'series_id = ? AND number = ?', whereArgs: [id, seasons]);
    }
    db.delete('series', where: 'id = ?', whereArgs: [id]);
  }
}

void deleteDB() async {
  deleteDatabase(join(await getDatabasesPath(), 'my_list.db'));
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('exists', false);
}

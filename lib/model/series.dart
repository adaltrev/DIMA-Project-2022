import 'dart:ffi';

import 'package:dima_project/db.dart';
import 'package:dima_project/model/season.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import './categories.dart';
import './serie.dart';

class Series extends ChangeNotifier {
  Series() {
    initSeries();
  }

  List<Serie> _series = [];

  List<Serie> get series {
    //can also simply do return _series
    return [..._series];
  }

  List<Serie> get watchingSeries {
    return _series
        .where((serie) => serie.category == Categories.watching)
        .toList();
  }

  List<Serie> get completedSeries {
    return _series
        .where((serie) => serie.category == Categories.completed)
        .toList();
  }

  List<Serie> get wishlistSeries {
    return _series
        .where((serie) => serie.category == Categories.wishlist)
        .toList();
  }

  void addSerie(Serie serie) {
    _series.add(serie);
    commitSeries(serie);
    notifyListeners();
  }

  void removeSeries(int id) {
    List<Serie> toRemove = _series.where((serie) => serie.id == id).toList();
    for (var serie in toRemove) {
      _series.remove(serie);
    }
    notifyListeners();
  }

  Serie getSerieByID(int id) {
    return _series.firstWhere((serie) => serie.id == id);
  }

  bool doesSerieExist(int id) {
    return _series.where((serie) => serie.id == id).toList().isNotEmpty;
  }

  void initSeries() async {
    _series = await loadData();
    notify();
  }

  void notify() {
    notifyListeners();
  }
}

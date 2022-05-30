import 'dart:math';

import 'package:test/test.dart';

import '../api.dart';
import 'package:dima_project/model/serie.dart';

void main() {
  test('findById function with valid ID', () async {
    final Future<dynamic> futureSerie = findById("1396");
    final Serie testSerie = await futureSerie;

    expect(testSerie.id, 1396);
    expect(testSerie.name, "Breaking Bad");
    expect(testSerie.posterPath, isNot(null));
    expect(testSerie.genre, "Drama");
    expect(testSerie.country, "US");
    expect(testSerie.overview, isNot(null));
    expect(testSerie.beginDate, "2008-01-20");
    expect(testSerie.endDate, "2013-09-29");
    expect(testSerie.status, "Ended");
    expect(testSerie.totalSeasons, 5);
    expect(testSerie.totalEpisodes, 62);
  });
}

import 'package:dima_project/model/Season.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Season', () {
    test('Check empty initialization', () {
      final season = Season(
          number: 1,
          posterPath: "posterPath",
          airDate: "01-01-2022",
          episodes: 15);
      expect(season.watched, 0);
    });

    test('Check non empty initialization', () {
      final season = Season(
          number: 1,
          posterPath: "posterPath",
          airDate: "01-01-2022",
          episodes: 15,
          watched: 19);
      expect(season.watched, 19);
    });

    test('Check empty method', () {
      final season = Season(
          number: 1,
          posterPath: "posterPath",
          airDate: "01-01-2022",
          episodes: 15,
          watched: 14);
      season.empty();
      expect(season.watched, 0);
    });

    test('Check complete method', () {
      final season = Season(
          number: 1,
          posterPath: "posterPath",
          airDate: "01-01-2022",
          episodes: 15,
          watched: 14);
      season.complete();
      expect(season.watched, 15);
    });
  });
}

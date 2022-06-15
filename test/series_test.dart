import 'package:dima_project/model/season.dart';
import 'package:dima_project/model/categories.dart';
import 'package:dima_project/model/serie.dart';
import 'package:dima_project/model/series.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<Season> seasons = [
    Season(
        number: 1,
        posterPath: "",
        airDate: "21/45/45",
        episodes: 15,
        watched: 3),
    Season(number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
  ];
  final sample1 = Serie(
      id: 11455,
      name: "Demon Slayer",
      beginDate: "2020",
      overview:
          "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
      category: Categories.watching,
      posterPath: "/wrCVHdkBlBWdJUZPvnJWcBRuhSY.jpg",
      seasons: seasons);
  final sample2 = Serie(
      id: 223,
      name: "Demon Slayer",
      beginDate: "2020",
      overview:
          "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
      category: Categories.completed,
      posterPath: "/wrCVHdkBlBWdJUZPvnJWcBRuhSY.jpg",
      seasons: seasons);

  group('Series', () {
    test('Check insertion and getters', () {
      final series = Series();
      series.addSerie(sample1);

      expect(series.series.contains(sample1), true);
      expect(series.series.contains(sample2), false);
      expect(series.watchingSeries.contains(sample1), true);

      series.addSerie(sample2);
      expect(series.series.contains(sample1), true);
      expect(series.series.contains(sample2), true);
      expect(series.watchingSeries.contains(sample2), false);
      expect(series.completedSeries.contains(sample2), true);

      expect(series.series.length, 2);
      expect(series.watchingSeries.length, 1);
      expect(series.completedSeries.length, 1);
      expect(series.wishlistSeries.length, 0);
    });

    test('Check remove series', () {
      final series = Series();

      series.addSerie(sample1);
      series.addSerie(sample2);

      series.removeSeries(sample1.id);
      expect(series.series.length, 1);
      expect(series.series.contains(sample1), false);
      expect(series.series.contains(sample2), true);

      series.removeSeries(sample2.id);
      expect(series.series.length, 0);
    });

    test('Check get by ID', () {
      final series = Series();

      series.addSerie(sample1);
      expect(series.getSerieByID(sample1.id), sample1);
    });
  });
}

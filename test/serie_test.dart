import 'package:dima_project/model/season.dart';
import 'package:dima_project/model/categories.dart';
import 'package:dima_project/model/serie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Serie', () {
    test('Check season add episode', () {
      List<Season> seasons = [
        Season(
            number: 1,
            posterPath: "",
            airDate: "21/45/45",
            episodes: 15,
            watched: 15),
        Season(number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
      ];
      final sampleSeries = Serie(
          id: 11455,
          name: "Demon Slayer",
          beginDate: "2020",
          overview:
              "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
          category: Categories.completed,
          posterPath: "/wrCVHdkBlBWdJUZPvnJWcBRuhSY.jpg",
          seasons: seasons);
      final serie = sampleSeries;

      var selectedSeason = sampleSeries.addEpisodes(0, 1);
      expect(selectedSeason, 0);
      expect(sampleSeries.currentlyWatchingSeason(), 1);
      expect(sampleSeries.seasonWatchingEpisode(0), 15);
      expect(sampleSeries.seasonWatchingEpisode(1), 0);

      selectedSeason = sampleSeries.addEpisodes(0, -1);
      expect(selectedSeason, 0);
      expect(sampleSeries.currentlyWatchingSeason(), 0);
      expect(sampleSeries.seasonWatchingEpisode(0), 14);
      expect(sampleSeries.seasonWatchingEpisode(1), 0);

      selectedSeason = sampleSeries.addEpisodes(0, 10);
      expect(selectedSeason, 1);
      expect(sampleSeries.currentlyWatchingSeason(), 1);
      expect(sampleSeries.seasonWatchingEpisode(0), 15);
      expect(sampleSeries.seasonWatchingEpisode(1), 0);

      selectedSeason = sampleSeries.addEpisodes(1, 10);
      expect(selectedSeason, 1);
      expect(sampleSeries.currentlyWatchingSeason(), 1);
      expect(sampleSeries.seasonWatchingEpisode(0), 15);
      expect(sampleSeries.seasonWatchingEpisode(1), 10);
    });
    test('Check currently watching season', () {
      List<Season> seasons = [
        Season(number: 1, posterPath: "", airDate: "21/45/45", episodes: 15),
        Season(number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
      ];
      final sampleSeries = Serie(
          id: 11455,
          name: "Demon Slayer",
          beginDate: "2020",
          overview:
              "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
          category: Categories.completed,
          posterPath: "/wrCVHdkBlBWdJUZPvnJWcBRuhSY.jpg",
          seasons: seasons);
      final serie = sampleSeries;
      expect(serie.currentlyWatchingSeason(), 0);
    });
    test('Check currently watching season 2', () {
      List<Season> seasons = [
        Season(
            number: 1,
            posterPath: "",
            airDate: "21/45/45",
            episodes: 15,
            watched: 15),
        Season(number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
      ];
      final sampleSeries = Serie(
          id: 11455,
          name: "Demon Slayer",
          beginDate: "2020",
          overview:
              "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
          category: Categories.completed,
          posterPath: "/wrCVHdkBlBWdJUZPvnJWcBRuhSY.jpg",
          seasons: seasons);
      final serie = sampleSeries;
      expect(serie.currentlyWatchingSeason(), 1);
    });
    test('Check season chunking', () {
      List<Season> seasons = [
        Season(
            number: 1,
            posterPath: "",
            airDate: "21/45/45",
            episodes: 15,
            watched: 15),
        Season(number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
      ];
      final sampleSeries = Serie(
          id: 11455,
          name: "Demon Slayer",
          beginDate: "2020",
          overview:
              "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
          category: Categories.completed,
          posterPath: "/wrCVHdkBlBWdJUZPvnJWcBRuhSY.jpg",
          seasons: seasons);
      final serie = sampleSeries;
      List<List<Season>> result = [];
      expect(serie.seasonsSublisted(1).length, 2);
    });
    test('Check season chunking 2', () {
      List<Season> seasons = [
        Season(
            number: 1,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/45",
            episodes: 11,
            watched: 11),
        Season(
            number: 2,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 12,
            watched: 12),
        Season(
            number: 3,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 13,
            watched: 13),
        Season(
            number: 4,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 14),
        Season(
            number: 5,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 15),
        Season(
            number: 6,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 16),
        Season(
            number: 7,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 17),
        Season(
            number: 8,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 18),
        Season(
            number: 9,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 19),
        Season(
            number: 10,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 20),
      ];
      final sampleSeries = Serie(
          id: 11455,
          name: "Demon Slayer",
          beginDate: "2020",
          overview:
              "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
          category: Categories.completed,
          posterPath: "/wrCVHdkBlBWdJUZPvnJWcBRuhSY.jpg",
          seasons: seasons);
      final serie = sampleSeries;
      expect(serie.seasonsSublisted(5).length, 2);
    });
    test('Check season watching episode', () {
      List<Season> seasons = [
        Season(
            number: 1,
            posterPath: "",
            airDate: "21/45/45",
            episodes: 15,
            watched: 15),
        Season(number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
      ];
      final sampleSeries = Serie(
          id: 11455,
          name: "Demon Slayer",
          beginDate: "2020",
          overview:
              "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
          category: Categories.completed,
          posterPath: "/wrCVHdkBlBWdJUZPvnJWcBRuhSY.jpg",
          seasons: seasons);
      final serie = sampleSeries;
      List<List<Season>> result = [];
      expect(serie.seasonWatchingEpisode(0), 15);
    });
    test('Check season watching episode 2', () {
      List<Season> seasons = [
        Season(
            number: 1,
            posterPath: "",
            airDate: "21/45/45",
            episodes: 15,
            watched: 15),
        Season(number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
      ];
      final sampleSeries = Serie(
          id: 11455,
          name: "Demon Slayer",
          beginDate: "2020",
          overview:
              "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
          category: Categories.completed,
          posterPath: "/wrCVHdkBlBWdJUZPvnJWcBRuhSY.jpg",
          seasons: seasons);
      final serie = sampleSeries;
      List<List<Season>> result = [];
      expect(serie.seasonWatchingEpisode(1), 0);
    });
    test('Check season total episodes', () {
      List<Season> seasons = [
        Season(
            number: 1,
            posterPath: "",
            airDate: "21/45/45",
            episodes: 15,
            watched: 15),
        Season(number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
      ];
      final sampleSeries = Serie(
          id: 11455,
          name: "Demon Slayer",
          beginDate: "2020",
          overview:
              "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
          category: Categories.completed,
          posterPath: "/wrCVHdkBlBWdJUZPvnJWcBRuhSY.jpg",
          seasons: seasons);
      final serie = sampleSeries;
      List<List<Season>> result = [];
      expect(serie.seasonTotalEpisodes(0), 15);
    });
    test('Check season total episodes 2', () {
      List<Season> seasons = [
        Season(
            number: 1,
            posterPath: "",
            airDate: "21/45/45",
            episodes: 15,
            watched: 15),
        Season(number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
      ];
      final sampleSeries = Serie(
          id: 11455,
          name: "Demon Slayer",
          beginDate: "2020",
          overview:
              "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
          category: Categories.completed,
          posterPath: "/wrCVHdkBlBWdJUZPvnJWcBRuhSY.jpg",
          seasons: seasons);
      final serie = sampleSeries;
      List<List<Season>> result = [];
      expect(serie.seasonTotalEpisodes(1), 23);
    });
    test('Check empty complete seasons methods', () {
      List<Season> seasons = [
        Season(
            number: 1,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/45",
            episodes: 11,
            watched: 11),
        Season(
            number: 2,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 12,
            watched: 12),
        Season(
            number: 3,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 13,
            watched: 13),
        Season(
            number: 4,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 14),
        Season(
            number: 5,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 15),
        Season(
            number: 6,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 16),
        Season(
            number: 7,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 17),
        Season(
            number: 8,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 18),
        Season(
            number: 9,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 19),
        Season(
            number: 10,
            posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
            airDate: "21/45/2022",
            episodes: 20),
      ];
      final sampleSeries = Serie(
          id: 11455,
          name: "Demon Slayer",
          beginDate: "2020",
          overview:
              "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
          category: Categories.completed,
          posterPath: "/wrCVHdkBlBWdJUZPvnJWcBRuhSY.jpg",
          seasons: seasons);

      sampleSeries.emptySeasons(0);
      expect(sampleSeries.seasons[0].watched, 11);
      expect(sampleSeries.seasons[1].watched, 0);
      expect(sampleSeries.seasons[2].watched, 0);
      expect(sampleSeries.seasons[3].watched, 0);
      expect(sampleSeries.seasons[4].watched, 0);
      expect(sampleSeries.seasons[5].watched, 0);
      expect(sampleSeries.seasons[6].watched, 0);
      expect(sampleSeries.seasons[7].watched, 0);
      expect(sampleSeries.seasons[8].watched, 0);
      expect(sampleSeries.seasons[9].watched, 0);

      sampleSeries.completeSeasons(5);
      expect(sampleSeries.seasons[0].watched, 11);
      expect(sampleSeries.seasons[1].watched, 12);
      expect(sampleSeries.seasons[2].watched, 13);
      expect(sampleSeries.seasons[3].watched, 14);
      expect(sampleSeries.seasons[4].watched, 15);
      expect(sampleSeries.seasons[5].watched, 0);
      expect(sampleSeries.seasons[6].watched, 0);
      expect(sampleSeries.seasons[7].watched, 0);
      expect(sampleSeries.seasons[8].watched, 0);
      expect(sampleSeries.seasons[9].watched, 0);
    });
  });
}

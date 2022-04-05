import 'package:dima_project/model/season.dart';
import 'package:flutter/cupertino.dart';

import './categories.dart';
import './serie.dart';

class Series extends ChangeNotifier {
  List<Season> seasons = [
    Season(number: 1, posterPath: "", airDate: "21/45/45", episodes: 15),
    Season(number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
  ];

  final List<Serie> _series = [
    Serie(
        id: 11455,
        name: "Demon Slayer",
        beginDate: "2020",
        overview:
            "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
        category: Categories.completed,
        posterPath: "/wrCVHdkBlBWdJUZPvnJWcBRuhSY.jpg",
        seasons: [
          Season(number: 1, posterPath: "", airDate: "21/45/45", episodes: 15),
          Season(
              number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
        ]),
    Serie(
        id: 4546,
        name: "Breaking Bad",
        beginDate: "2014",
        overview:
            "Excepteur nulla sint enim exercitation exercitation ex dolor. Aliqua incididunt dolor nisi est dolore id velit cupidatat sit ullamco elit velit sit. Eiusmod minim incididunt ea cillum cillum Lorem nisi minim et velit qui consectetur. Veniam tempor consectetur reprehenderit labore fugiat ea consequat eiusmod anim incididunt irure consectetur. Consectetur veniam sit sunt fugiat.",
        category: Categories.completed,
        posterPath: "/ggFHVNu6YYI5L9pCfOacjizRGt.jpg",
        seasons: [
          Season(number: 1, posterPath: "", airDate: "21/45/45", episodes: 15),
          Season(
              number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
        ]),
    Serie(
        id: 4587,
        name: "Squid Game",
        beginDate: "2020",
        overview:
            "Est dolor fugiat id laborum cupidatat. Do consequat quis est ea culpa officia labore cillum. Reprehenderit deserunt dolor esse officia ad mollit nisi. Eiusmod fugiat sunt esse Lorem.",
        category: Categories.wishlist,
        posterPath: "/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg",
        seasons: [
          Season(number: 1, posterPath: "", airDate: "21/45/45", episodes: 15),
          Season(
              number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
        ]),
    Serie(
        id: 45487,
        name: "Strappare lungo i bordi",
        beginDate: "2020",
        overview:
            "Aliqua labore Lorem culpa et ad voluptate labore ex ad fugiat pariatur ut. Elit mollit deserunt eiusmod laborum quis occaecat. Pariatur elit magna enim cillum. Eiusmod cillum incididunt eiusmod mollit aute officia. Proident deserunt esse elit sit pariatur. Ad adipisicing aute incididunt sint occaecat adipisicing ex commodo voluptate nulla minim sint fugiat.",
        category: Categories.wishlist,
        posterPath: "/jD8abZSQ9zMOsqr1M7zButnzCuz.jpg",
        seasons: [
          Season(number: 1, posterPath: "", airDate: "21/45/45", episodes: 15),
          Season(
              number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
        ]),
    Serie(
        id: 46546,
        name: "The Office",
        beginDate: "2020",
        overview:
            "Deserunt reprehenderit irure culpa enim quis. Veniam excepteur laborum dolor elit consequat anim eiusmod ex nostrud deserunt cupidatat. Reprehenderit ex irure magna et nostrud cillum. Consectetur qui in velit velit ea esse irure incididunt ut est dolor dolore.",
        category: Categories.watching,
        posterPath: "/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg",
        seasons: [
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
        ]),
    Serie(
        id: 84,
        name: "Friends",
        beginDate: "2020",
        overview:
            "Sint commodo labore et ad esse ea voluptate minim aute aliqua commodo mollit cupidatat exercitation. Proident veniam proident ut est Lorem minim ea nulla incididunt laboris anim. Nostrud reprehenderit do in duis laboris amet commodo eiusmod. Pariatur sit laboris deserunt deserunt nostrud excepteur exercitation est.",
        category: Categories.watching,
        posterPath: "/f496cm9enuEsZkSPzCwnTESEK5s.jpg",
        seasons: [
          Season(number: 1, posterPath: "", airDate: "21/45/45", episodes: 15),
          Season(
              number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
        ]),
    Serie(
        id: 7478,
        name: "Attack on Titan",
        beginDate: "2020",
        overview:
            "Est excepteur duis dolor veniam. Lorem non adipisicing fugiat duis anim aliqua enim. Non et amet incididunt adipisicing cillum aute culpa occaecat reprehenderit aute duis non consequat ex. Incididunt ut commodo quis occaecat mollit eiusmod ad velit sit officia elit sint mollit.",
        category: Categories.watching,
        posterPath: "/aiy35Evcofzl7hASZZvsFgltHTX.jpg",
        seasons: [
          Season(number: 1, posterPath: "", airDate: "21/45/45", episodes: 15),
          Season(
              number: 2, posterPath: "", airDate: "21/45/2022", episodes: 23),
        ]),
  ];

  List<Serie> get series {
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
    notifyListeners();
  }
}

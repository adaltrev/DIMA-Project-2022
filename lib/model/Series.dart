import 'package:flutter/cupertino.dart';

import './categories.dart';
import './serie.dart';

class Series extends ChangeNotifier {
  final List<Serie> _series = [
    Serie(
        "Demon Slayer",
        "2020",
        "In magna aliquip incididunt ut culpa tempor excepteur pariatur fugiat aute labore laborum ad laboris. Ad sint ad tempor excepteur laborum veniam nisi occaecat esse nostrud. Consequat et culpa in commodo magna tempor ea dolore reprehenderit aute culpa occaecat. Velit aute laboris voluptate esse sint esse aliqua enim laborum irure enim fugiat velit. Consectetur cillum magna enim do. Est in fugiat culpa eiusmod cillum officia adipisicing magna esse eu veniam enim. Cillum adipisicing nostrud elit cillum eu pariatur dolor officia.",
        Categories.completed,
        "https://www.animeclick.it/immagini/anime/Kimetsu_no_Yaiba/cover/Kimetsu_no_Yaiba-cover.jpg"),
    Serie(
        "Breaking Bad",
        "2014",
        "Excepteur nulla sint enim exercitation exercitation ex dolor. Aliqua incididunt dolor nisi est dolore id velit cupidatat sit ullamco elit velit sit. Eiusmod minim incididunt ea cillum cillum Lorem nisi minim et velit qui consectetur. Veniam tempor consectetur reprehenderit labore fugiat ea consequat eiusmod anim incididunt irure consectetur. Consectetur veniam sit sunt fugiat.",
        Categories.completed,
        "https://www.tvserial.it/wp-content/uploads/2021/08/breaking-bad-locandina-credits-amc-460x600.jpg"),
    Serie(
        "Squid Game",
        "2020",
        "Est dolor fugiat id laborum cupidatat. Do consequat quis est ea culpa officia labore cillum. Reprehenderit deserunt dolor esse officia ad mollit nisi. Eiusmod fugiat sunt esse Lorem.",
        Categories.wishlist,
        "https://www.asianfeast.org/wp-content/uploads/2021/10/squid-game.jpeg"),
    Serie(
        "Strappare lungo i bordi",
        "2020",
        "Aliqua labore Lorem culpa et ad voluptate labore ex ad fugiat pariatur ut. Elit mollit deserunt eiusmod laborum quis occaecat. Pariatur elit magna enim cillum. Eiusmod cillum incididunt eiusmod mollit aute officia. Proident deserunt esse elit sit pariatur. Ad adipisicing aute incididunt sint occaecat adipisicing ex commodo voluptate nulla minim sint fugiat.",
        Categories.wishlist,
        "https://mr.comingsoon.it/rsz/serietv/serie/3308/3308.jpg?preset=pstr300"),
    Serie(
        "The Office",
        "2020",
        "Deserunt reprehenderit irure culpa enim quis. Veniam excepteur laborum dolor elit consequat anim eiusmod ex nostrud deserunt cupidatat. Reprehenderit ex irure magna et nostrud cillum. Consectetur qui in velit velit ea esse irure incididunt ut est dolor dolore.",
        Categories.watching,
        "https://m.media-amazon.com/images/I/81NK3yCvMJL._SL1500_.jpg"),
    Serie(
        "Friends",
        "2020",
        "Sint commodo labore et ad esse ea voluptate minim aute aliqua commodo mollit cupidatat exercitation. Proident veniam proident ut est Lorem minim ea nulla incididunt laboris anim. Nostrud reprehenderit do in duis laboris amet commodo eiusmod. Pariatur sit laboris deserunt deserunt nostrud excepteur exercitation est.",
        Categories.watching,
        "https://m.media-amazon.com/images/I/71e+16M0u6L._SL1024_.jpg"),
    Serie(
        "Attack on Titan",
        "2020",
        "Est excepteur duis dolor veniam. Lorem non adipisicing fugiat duis anim aliqua enim. Non et amet incididunt adipisicing cillum aute culpa occaecat reprehenderit aute duis non consequat ex. Incididunt ut commodo quis occaecat mollit eiusmod ad velit sit officia elit sint mollit.",
        Categories.watching,
        "https://m.media-amazon.com/images/M/MV5BNzc5MTczNDQtNDFjNi00ZDU5LWFkNzItOTE1NzQzMzdhNzMxXkEyXkFqcGdeQXVyNTgyNTA4MjM@._V1_.jpg"),
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
  }
}

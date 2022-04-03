import 'package:dima_project/model/season.dart';

import './categories.dart';

class Serie {
  final int id;
  final String name;
  final String posterPath;
  final String genre;
  final String country;
  final String overview;
  final String beginDate;
  final String endDate;
  final String status;
  final int totalSeasons;
  final int totalEpisodes;
  Categories category;
  final List<Season> seasons;

  Serie(
      {required this.id,
      required this.name,
      required this.posterPath,
      //deafault data to make dummy data easier to write
      this.genre = "fantasy",
      this.country = "italy",
      this.overview = "bello da vedere",
      this.beginDate = "01/01/2001",
      this.endDate = "22/05/2022",
      this.status = "in progress",
      this.totalSeasons = 1,
      this.totalEpisodes = 25,
      this.category = Categories.watching,
      required this.seasons});
}

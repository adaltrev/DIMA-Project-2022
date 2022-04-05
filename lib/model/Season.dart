class Season {
  final int number;
  final String posterPath;
  final String airDate;
  final int episodes;
  int watched;

  Season(
      {required this.number,
      required this.posterPath,
      required this.airDate,
      required this.episodes,
      this.watched = 0});

  bool completed() {
    return episodes == watched ? true : false;
  }
}

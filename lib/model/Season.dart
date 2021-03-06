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

  void empty() {
    watched = 0;
  }

  void complete() {
    watched = episodes;
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'posterPath': posterPath,
      'airDate': airDate,
      'episodes': episodes,
      'watched': watched,
    };
  }
}

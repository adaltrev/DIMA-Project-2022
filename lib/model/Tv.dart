class Tv {
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
  final List seasons;

  Tv(
    this.id,
    this.name,
    this.posterPath,
    this.genre,
    this.country,
    this.overview,
    this.beginDate,
    this.endDate,
    this.status,
    this.totalSeasons,
    this.totalEpisodes,
    this.seasons,
  );
}

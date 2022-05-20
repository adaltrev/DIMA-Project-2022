import 'package:dima_project/model/categories.dart';
import 'package:dima_project/model/season.dart';
import 'package:flutter/foundation.dart';

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
      this.totalSeasons = 7,
      this.totalEpisodes = 25,
      this.category = Categories.searched,
      required this.seasons});

  //return the season we are currently watching
  int currentlyWatchingSeason() {
    int i = 0;
    for (var season in seasons) {
      if (!season.completed()) {
        return i;
      } else {
        i++;
      }
    }

    return 0;
  }

  //returns a list containing lists containing max 8 seasons each. To be used
  //in details page when building page view with inside grid views
  seasonsSublisted(int chunkSize) {
    List<List<Season>> result = [];
    for (var i = 0; i < seasons.length; i += chunkSize) {
      result.add(seasons.sublist(
          i, i + chunkSize > seasons.length ? seasons.length : i + chunkSize));
    }
    return result;
  }

  seasonWatchingEpisode(int seasonNumber) {
    return seasons.elementAt(seasonNumber).watched;
  }

  seasonTotalEpisodes(int seasonNumber) {
    return seasons.elementAt(seasonNumber).episodes;
  }

  //add episodes to season and return the index of the card that should be selected
  addEpisodes(int selectedCardIndex, int quantity) {
    Season selectedSeason = seasons.elementAt(selectedCardIndex);

    //if I have selected the season I'm currently watching
    if (selectedCardIndex == currentlyWatchingSeason()) {
      selectedSeason.watched += quantity;

      //if i've watched all the episodes
      if (selectedSeason.watched >= selectedSeason.episodes) {
        selectedSeason.watched = selectedSeason.episodes;

        //If all seasons complete, change category
        if (selectedSeason.number >= seasons.length) {
          //TODO decide if keep this, because is i complete a serie by adding episodes and then remove episodes the series stays complete
          changeCategory(Categories.completed);
        }
        //if I'm not in the last season return index of the next season otherwise return the last season
        int increment = selectedSeason.number < seasons.length ? 1 : 0;
        return selectedCardIndex + increment;
        //if I go lower than 0 for episodes
      } else if (selectedSeason.watched < 0) {
        selectedSeason.watched = 0;
        int decrement = selectedSeason.number > 1 ? 1 : 0;
        return selectedCardIndex - decrement;
      } else {
        return selectedCardIndex;
      }
    } else {
      //if the sesaon is complete and I want to decrement
      if (selectedSeason.completed() && quantity < 0) {
        selectedSeason.watched += quantity;
        emptySeasons(selectedCardIndex);
      } else if (!selectedSeason.completed() && quantity > 0) {
        selectedSeason.watched += quantity;
        completeSeasons(selectedCardIndex);
      }
      return selectedCardIndex;
    }
  }

  void emptySeasons(int selectedCardIndex) {
    seasons.asMap().forEach((index, season) {
      if (index > selectedCardIndex) {
        season.empty();
      }
    });
  }

  void completeSeasons(int selectedCardIndex) {
    seasons.asMap().forEach((index, season) {
      if (index < selectedCardIndex) {
        season.complete();
      }
    });
  }

  void changeCategory(Categories status) {
    category = status;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'posterPath': posterPath,
      'genre': genre,
      'country': country,
      'overview': overview,
      'beginDate': beginDate,
      'endDate': endDate,
      'status': status,
      'totalSeasons': totalSeasons,
      'totalEpisodes': totalEpisodes,
      'category': category.toString()
    };
  }
}

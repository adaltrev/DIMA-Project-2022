import 'package:dima_project/model/tv_search.dart';
import 'package:dima_project/model/season.dart';
import 'package:dima_project/model/serie.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = '7e3a5060da588840023b8c9b62a0b006';
const endPoint = 'https://api.themoviedb.org/3/';

//Given TV series id, fetch detailed data from Themoviedb.org, including basic information for all seasons
findById(String id) async {
  if (id == "") {
    return [];
  }
//example
//https://api.themoviedb.org/3/tv/46298?api_key=7e3a5060da588840023b8c9b62a0b006&language=en-US
  var response = await http.get(Uri.parse(
      endPoint + "tv/" + id + "?api_key=" + apiKey + "&language=en-US"));
  dynamic body = json.decode(response.body);

  List<Season> seasons = <Season>[];
  for (var item in body['seasons']) {
    if (item['season_number'] > 0) {
      if (item['poster_path'] == null) {
        item['poster_path'] = body['poster_path'];
      }
      seasons.add(Season(
          number: item['season_number'],
          posterPath: item['poster_path'],
          airDate: item['air_date'] ?? "N/A",
          episodes: item['episode_count']));
    }
  }

  return Serie(
      id: body['id'],
      name: body['name'],
      posterPath: body['poster_path'],
      genre: body['genres'].length == 0 ? "N/A" : body['genres'][0]['name'],
      country: body['origin_country'].length == 0
          ? "N/A"
          : body['origin_country'][0],
      overview: body['overview'],
      beginDate: body['first_air_date'] ?? "N/A",
      endDate: body['last_air_date'] ?? "N/A",
      status: body['status'],
      totalSeasons: body['number_of_seasons'],
      totalEpisodes: body['number_of_episodes'],
      seasons: seasons);
}

//Given a search query, fetch Themoviedb.org and return simple data for each result
searchByName(String query) async {
  if (query == "") {
    return [];
  }

  var response = await http.get(Uri.parse(endPoint +
      "search/tv/?api_key=" +
      apiKey +
      "&language=en-US&page=1&query=" +
      query +
      "&include_adult=false"));

  dynamic body = json.decode(response.body);

  List<TvSearch> results = <TvSearch>[];

  while (true) {
    for (var item in body['results']) {
      if (item['poster_path'] != null) {
        results.add(TvSearch(item['id'], item['poster_path'], item['name']));
      }
    }

    if (body['page'] == body['total_pages'] || body['page'] == 4) {
      return results;
    } else {
      int next = body['page'] + 1;
      response = await http.get(Uri.parse(endPoint +
          "search/tv/?api_key=" +
          apiKey +
          "&language=en-US&page=" +
          next.toString() +
          "&query=" +
          query +
          "&include_adult=false"));
      body = json.decode(response.body);
    }
  }
}

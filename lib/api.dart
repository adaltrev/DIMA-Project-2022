import './model/Tv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = '7e3a5060da588840023b8c9b62a0b006';
const endPoint = 'https://api.themoviedb.org/3/';

findById(String id) async {
  if (id == "") {
    return [];
  }

  var response = await http.get(Uri.parse(
      endPoint + "tv/" + id + "?api_key=" + apiKey + "&language=en-US"));
  dynamic body = json.decode(response.body);

  return Tv(
      body['id'],
      body['name'],
      body['poster_path'],
      body['genres'][0]['name'],
      body['origin_country'][0],
      body['overview'],
      body['first_air_date'],
      body['last_air_date'],
      body['status'],
      body['number_of_seasons'],
      body['number_of_episodes']);
}

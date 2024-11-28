import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:tradexa_assignment/movie_list_model.dart';
import 'package:tradexa_assignment/movie_model.dart';
class MovieProvider with ChangeNotifier
{

  static Future<MovieModel> getSearch(String search) async
  {
    Response response=await get(Uri.parse("https://imdb-movies-web-series-etc-search.p.rapidapi.com/${search}.json"),headers: {"x-rapidapi-key": "c9fafc24demsha3f031414df4830p1cd970jsn045a0f47ffa3","x-rapidapi-host": "imdb-movies-web-series-etc-search.p.rapidapi.com"});
    final Map<String, dynamic> json = jsonDecode(response.body);
    return MovieModel.fromJson(json['d'][0]);
  }

 static Future<List<MovieListModel>> getMovie() async
 {
   Response response=await get(Uri.parse("https://imdb-top-100-movies.p.rapidapi.com/"),headers: {"x-rapidapi-key": "2d500acccemshd574d855568ea1ap1ab5ebjsn6ffa38b581d5","x-rapidapi-host": "imdb-top-100-movies.p.rapidapi.com"});
   List<dynamic>items=jsonDecode(response.body);

   return items.map((toElement)=>MovieListModel.fromJson(toElement)).toList();

 }

}

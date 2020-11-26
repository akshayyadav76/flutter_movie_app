import 'dart:convert';

import 'package:flutter_movie_app/data/core/api_client.dart';
import 'package:flutter_movie_app/data/models/movie_model.dart';
import 'package:flutter_movie_app/data/models/movie_result_model.dart';
import 'package:http/http.dart';
import '../core/api_constants.dart';


abstract class MovieRemoteDataSource{
Future<List<MovieModel>> getTranding();
Future<List<MovieModel>> getPopular();
Future<List<MovieModel>> getUpcomming();
Future<List<MovieModel>> getPlayingNow();

}


class MovieRemoteDataSourceImpl extends MovieRemoteDataSource{

final ApiClient _client;

MovieRemoteDataSourceImpl(this._client);


  @override
  Future<List<MovieModel>> getTranding()async {
   
    final response = await _client.get("trending/movie/day");
    final movies = MovieResultModel.fromJson(response).movies;
    print(movies);
   return movies;
  }

  @override
  Future<List<MovieModel>> getPopular()async {

   final response = await _client.get("movie/popular");
    final movies = MovieResultModel.fromJson(response).movies;
    print(movies);
   return movies;

  }

  @override
  Future<List<MovieModel>> getPlayingNow()async {
    final response = await _client.get("movie/now_playing");
    final movies = MovieResultModel.fromJson(response).movies;
    print(movies);
   return movies;
  }

  @override
  Future<List<MovieModel>> getUpcomming()async {
    final response = await _client.get("movie/upcoming");
    final movies = MovieResultModel.fromJson(response).movies;
    print(movies);
   return movies;
  }




}
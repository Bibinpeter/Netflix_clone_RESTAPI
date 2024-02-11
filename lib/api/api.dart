import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:netflixapi/core/colors/constants.dart';
import 'package:netflixapi/models/movie.dart';

class Api {
  static const _airingTodayUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${constants.apiKey}";
  static const _ontheairUrl =
      "https://api.themoviedb.org/3/tv/top_rated?api_key=${constants.apiKey}";
  static const _popularUrl =
      "https://api.themoviedb.org/3/tv/airing_today?api_key=${constants.apiKey}";
  static const _topratedUrl =
      "https://api.themoviedb.org/3/trending/tv/day?api_key=${constants.apiKey}";
  static const _horrorUrl =
      'https://api.themoviedb.org/3/discover/movie?api_key=${constants.apiKey}&with_genres=27';
  static const _upcomingMovies =
      'https://api.themoviedb.org/3/discover/movie?api_key=${constants.apiKey}&with_genres=36';
  static const _everyonesWatching =
      "https://api.themoviedb.org/3/trending/all/week?api_key=${constants.apiKey}";
  static const allmovie =
      'https://api.themoviedb.org/3/discover/movie?api_key=${constants.apiKey}&with_genres=28';
  static const originals =
      "https://api.themoviedb.org/3/tv/top_rated?api_key=${constants.apiKey}";
//////////////////////GET TRENDING MOVIES
  Future<List<Movie>> getTrending() async {
    final response = await http.get(Uri.parse(_airingTodayUrl));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['results'] as List<dynamic>;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happened");
    }
  }

//////////////////////GET TOP RATED MOVIES
  Future<List<Movie>> gettopRated() async {
    final response = await http.get(Uri.parse(_ontheairUrl));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['results'] as List<dynamic>;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happened");
    }
  }

///////////////////////GET AIRING TODAY
  Future<List<Movie>> getairingToday() async {
    final response = await http.get(Uri.parse(_popularUrl));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['results'] as List<dynamic>;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happened");
    }
  }

  ////////////////////GET UPCOMING MOVIES
  Future<List<Movie>> getupcoming() async {
    final response = await http.get(Uri.parse(_topratedUrl));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['results'] as List<dynamic>;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happened");
    }
  }

//////////////////////GET PEOPLE
  Future<List<Movie>> gethorror() async {
    final response = await http.get(Uri.parse(_horrorUrl));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['results'] as List<dynamic>;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happened");
    }
  }

  Future<List<Movie>> getupcomingmovies() async {
    final response = await http.get(Uri.parse(_upcomingMovies));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['results'] as List<dynamic>;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happened");
    }
  }

  Future<List<Movie>> everyonesWatchingMovie() async {
    final response = await http.get(Uri.parse(_everyonesWatching));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['results'] as List<dynamic>;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happened");
    }
  }

  Future<List<Movie>> getSearchedMovies(String value) async {
    final url ="https://api.themoviedb.org/3/search/movie?api_key=${constants.apiKey}&query=$value";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> results = jsonData['results'];

      // Map each result to a Movie object
      final List<Movie> movies =
          results.map((json) => Movie.fromJson(json)).toList();

      return movies;
    } else {
      throw Exception('Failed to load search results');
    }
  }
}

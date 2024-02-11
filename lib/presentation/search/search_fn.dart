// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:netflixapi/core/colors/constants.dart';
// import 'package:netflixapi/models/movie.dart';



// Future<List<Movie>> getSearchedMovies(String value) async {
//   const originals =
//       "https://api.themoviedb.org/3/tv/top_rated?api_key=${constants.apiKey}";
//   final response = await http.get(Uri.parse(originals));
//   if (response.statusCode == 200) {
//     final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
//     final List<dynamic> results = jsonData['results'];
//     final List<Movie> moviesList = results.map((json) => Movie.fromJson(json)).toList();
//     return moviesList;
//   } else {
//     throw Exception('try again');
//   }
// }

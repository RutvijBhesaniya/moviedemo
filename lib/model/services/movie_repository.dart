import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviedemo/model/new_movies.dart';
import 'package:moviedemo/model/recommended_movies.dart';

//This Api is for New Movies
Future<NewMovies> fetchMovies() async {
  final response = await http.get(
    Uri.parse('https://imdb-api.com/en/API/MostPopularMovies/k_kez41nvt'),
  );

  if (response.statusCode == 200) {
    print(response);

    return NewMovies.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

//This Api is for Recommended  Movies
Future<RecommendedMovies> fetchRecommendedMovies() async {
  final response = await http.get(
    Uri.parse('https://imdb-api.com/en/API/ComingSoon/k_kez41nvt'),
  );

  if (response.statusCode == 200) {
    print(response);

    return RecommendedMovies.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

// class MovieRepository {
//Fetching data
// BaseService _movieService = MovieService();
//
// Future<List<Movie>> fetchMovieList(String value) async {
//   dynamic response = await _movieService.getResponse(value);
//   final jsonData = response['results'] as List;
//   print(jsonData);
//   List<Movie> movieList = jsonData
//       .map((tagJson) => Movie.fromJson(tagJson))
//       .toList as List<Movie>;
//   return movieList;
// }
// }

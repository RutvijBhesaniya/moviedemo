import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviedemo/model/movie.dart';

Future<Movie> fetchMovies() async {
  final response = await http.get(
      Uri.parse('https://imdb-api.com/en/API/MostPopularMovies/k_kez41nvt'));

  if (response.statusCode == 200) {
    print(response);

    return Movie.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
// List<Movie> parseMovies(String responseBody) {
//   var list = json.decode(responseBody) as List<dynamic>;
//   List<Movie> movies = list.map((e) => Movie.fromJson(e)).toList();
//   return movies;
// }
//
// Future<List<Movie>> fetchMovies() async {
//   final response = await http.get(url);
//   if (response.statusCode == 200)
//     return compute(parseMovies, response.body);
//   else
//     throw Exception('cannot get data');
// }

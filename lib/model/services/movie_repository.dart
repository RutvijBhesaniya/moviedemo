import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviedemo/model/apis/base_api.dart';
import 'package:moviedemo/model/new_movies.dart';
import 'package:moviedemo/model/recommended_movies.dart';

///api for new movies
Future<NewMovies> fetchMovies() async {
  final response = await http.get(
    Uri.parse(BaseApi.NEW_MOVIES),
  );

  if (response.statusCode == 200) {
    print(response);

    return NewMovies.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

///api for recommended  movies
Future<RecommendedMovies> fetchRecommendedMovies() async {
  final response = await http.get(
    Uri.parse(BaseApi.RECOMMENDED_MOVIES),
  );

  if (response.statusCode == 200) {
    print(response);

    return RecommendedMovies.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

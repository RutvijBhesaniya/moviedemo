import 'package:flutter/material.dart';
import 'package:moviedemo/model/apis/api_response.dart';
import 'package:moviedemo/model/movie.dart';
import 'package:moviedemo/model/movie_repository.dart';

class MovieViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty Data');

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> fetchMovieData(String value) async {
    _apiResponse = ApiResponse.loading('Fetching data');
    notifyListeners();
    try {
      List<Movie> movieList = await MovieRepository().fetchMovieList(value);
      _apiResponse = ApiResponse.completed(movieList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }
}

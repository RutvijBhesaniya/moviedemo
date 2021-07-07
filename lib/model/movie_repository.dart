import 'package:moviedemo/model/movie.dart';
import 'package:moviedemo/model/services/base_service.dart';
import 'package:moviedemo/model/services/movie_service.dart';

class MovieRepository {
  BaseService _movieService = MovieService();

  Future<List<Movie>> fetchMovieList(String value) async {
    dynamic response = await _movieService.getResponse(value);
    final jsonData = response['results'] as List;
    print(jsonData);
    List<Movie> movieList = jsonData
        .map((tagJson) => Movie.fromJson(tagJson))
        .toList as List<Movie>;
    return movieList;
  }
}

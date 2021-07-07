abstract class BaseService{
 final String movieBaseUrl = 'https://imdb-api.com/en/API/MostPopularMovies/k_kez41nvt';
 Future<dynamic> getResponse(String url);
}
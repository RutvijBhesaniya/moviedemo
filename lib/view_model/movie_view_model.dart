import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedemo/model/movie.dart';
import 'package:moviedemo/model/networks/fetch_api.dart';

// class MovieViewModel extends ChangeNotifier {
//   ApiResponse _apiResponse = ApiResponse.initial('Empty Data');
//
//   ApiResponse get response {
//     return _apiResponse;
//   }
//
//   Future<void> fetchMovieData(String value) async {
//     _apiResponse = ApiResponse.loading('Fetching data');
//     notifyListeners();
//     try {
//       List<Movie> movieList = await MovieRepository().fetchMovieList(value);
//       _apiResponse = ApiResponse.completed(movieList);
//     } catch (e) {
//       _apiResponse = ApiResponse.error(e.toString());
//       print(e);
//     }
//     notifyListeners();
//   }
// }
final movieStateFuture = FutureProvider<Movie>((ref) async {
  return fetchMovies();
});

// enum NavigationBarEvent { HOME, PROFIL }
//
// class NavigationNotifier extends StateNotifier<PageModel> {
//   NavigationNotifier() : super(defaultPage);
//   static const defaultPage = PageModel(NavigationBarEvent.HOME);
//
//   void selectPage(int i) {
//     switch (i) {
//       case 0:
//         state = PageModel(NavigationBarEvent.HOME);
//         break;
//       case 1:
//         state = PageModel(NavigationBarEvent.PROFIL);
//         break;
//     }
//   }
// }
//
// class PageModel {
//   const PageModel(this.page);
//
//   final NavigationBarEvent page;
// }

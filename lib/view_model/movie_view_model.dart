import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedemo/model/new_movies.dart';
import 'package:moviedemo/model/services/movie_repository.dart';
import 'package:moviedemo/model/recommended_movies.dart';
import 'package:moviedemo/view/screens/favourite_screen.dart';
import 'package:moviedemo/view/screens/home_screen.dart';
import 'package:moviedemo/view/screens/media_screen.dart';
import 'package:moviedemo/view/screens/profile_screen.dart';

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




//New Movies Api fetching using Riverpod
final movieStateFuture = FutureProvider<NewMovies>((ref) async {
  return fetchMovies();
});


//Recommended Movies Api fetching using Riverpod
final recommendedStateFuture = FutureProvider<RecommendedMovies>((ref)async{
  return fetchRecommendedMovies();
});

//BottomNavigationBar Notifier
class BottomNavigationBarModel extends ChangeNotifier {
  int _currentTab = 0;
  List<Widget> _screens = [
    HomeScreen(),
    MediaScreen(),
    FavouriteScreen(),
    ProfileScreen()
  ];

  set currentTab(int tab) {
    this._currentTab = tab;
    notifyListeners();
  }

  int get currentTab => this._currentTab;

  get currentScreen => this._screens[this._currentTab];
}



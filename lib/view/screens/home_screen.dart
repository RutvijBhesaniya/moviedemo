import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedemo/model/movie.dart';
import 'package:moviedemo/utils/style.dart';
import 'package:moviedemo/view/screens/detail_screen.dart';
import 'package:moviedemo/view_model/movie_view_model.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<Movie> movies = watch(movieStateFuture);
    return Scaffold(
      body: movies.when(
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) => Center(
          child: Text('${err.toString()}'),
        ),
        data: (movies) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: Column(
                  children: [
                    appBar(),
                    SizedBox(
                      height: 20,
                    ),
                    searchBar(),
                    SizedBox(
                      height: 20,
                    ),
                    // Text(movies.items![index].title!),
                    categories(movies),
                    // categories(movies),
                    SizedBox(
                      height: 28,
                    ),
                    newMovies(movies)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    // bottomNavigationBar: bottomNavigationBar());
  }
}

//appBar
Widget appBar() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hello',
                  style: TextStyles.largeHeadline!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorStyles.black,
                  ),
                ),
                Text(
                  ' Rutvij',
                  style: TextStyles.largeHeadline!.copyWith(
                    color: ColorStyles.grey,
                  ),
                ),
              ],
            ),
            Text(
              'Let\'s watch today',
              style: TextStyles.labelName!.copyWith(
                color: ColorStyles.grey,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.yellow,
          // backgroundImage: NetworkImage(
          //
          // ),
        )
      ],
    ),
  );
}

//searchBar
Widget searchBar() {
  return TextFormField(
    decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: ColorStyles.grey),
        fillColor: ColorStyles.light_grey,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorStyles.light_grey),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: ColorStyles.grey,
        ),
        suffixIcon: Icon(
          Icons.speaker,
          color: ColorStyles.grey,
        )),
  );
}

//categories
Widget categories(Movie movies) {
  return Column(
    children: [
      categoryHeading(),
      Container(
        height: 80,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: tempList().length,
          itemBuilder: (context, index) {
            return categoryDetails(movies);
          },
        ),
      )
    ],
  );
}

//categoryHeading
Widget categoryHeading() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Categories',
        style: TextStyles.largeHeadline!
            .copyWith(color: ColorStyles.black, fontWeight: FontWeight.bold),
      ),
      Text(
        'See all',
        style: TextStyles.labelName!.copyWith(
          color: ColorStyles.grey,
        ),
      )
    ],
  );
}

//categoryDetails
Widget categoryDetails(Movie movies) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 8, 12, 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.pink[50],
    ),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          width: 75,
          height: 30,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(
                // movies![0].items!.first.image!,
                'assets/images/smiley.png',
              ),
            ),
          ),
        ),
        Text(
          'Comedy',
          style: TextStyles.subtitle!.copyWith(color: ColorStyles.grey),
        )
      ],
    ),
  );
}

//movies
Widget newMovies(Movie movies) {
  return Column(
    children: [
      newMoviesHeading(),
      Container(
        height: 300,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: movies.items!.length,
          itemBuilder: (context, index) {
            return newMoviesDetails(movies, index, context);
          },
        ),
      )

      // newMoviesBody(),
    ],
  );
}

//moviesHeading
Widget newMoviesHeading() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'New Movies',
        style: TextStyles.largeHeadline!
            .copyWith(color: ColorStyles.black, fontWeight: FontWeight.bold),
      ),
      Text(
        'See all',
        style: TextStyles.labelName!.copyWith(
          color: ColorStyles.grey,
        ),
      )
    ],
  );
}

//movieDetails
Widget newMoviesDetails(Movie movies, int index, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(movies: movies,index:index),
        ),
      );
    },
    child: Container(
      width: 180,
      margin: const EdgeInsets.fromLTRB(0, 8, 12, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: new BoxDecoration(
              // color: Colors.pink
              image: new DecorationImage(
                  image: new NetworkImage(
                    movies.items![index].image!,
                  ),
                  fit: BoxFit.fill),
            ),
            height: 210,
            width: 160,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            movies.items![index].title!,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.labelName!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            movies.items![index].fullTitle!,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.subhead.copyWith(
              color: ColorStyles.grey,
            ),
          ),
          Row(
            children: [
              Text(
                'Rating :-',
                style: TextStyles.subhead.copyWith(
                  color: ColorStyles.grey,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                movies.items![index].imDbRating!,
                style: TextStyles.subhead.copyWith(
                  color: ColorStyles.black,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

// Widget bottomNavigationBar() {
//   return BottomNavigationBar(
//     currentIndex: _currentIndex,
//     type: BottomNavigationBarType.fixed,
//     items: [
//       BottomNavigationBarItem(
//         icon: Icon(
//           Icons.home,
//           color: ColorStyles.grey,
//         ),
//         title: Text(''),
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(
//           Icons.perm_media_sharp,
//           color: ColorStyles.grey,
//         ),
//         title: Text(''),
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(
//           Icons.favorite_outline_rounded,
//           color: ColorStyles.grey,
//         ),
//         title: Text(''),
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(
//           Icons.account_circle_sharp,
//           color: ColorStyles.grey,
//         ),
//         title: Text(''),
//       ),
//     ],
//   );
// }

List<String> tempList() => [
      "test",
      "test",
      "test",
      'test',
      'test',
      "test",
      'test',
      'test',
      "test",
      'test',
      'test',
      "test",
      'test',
      'test'
    ];

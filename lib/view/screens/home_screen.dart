import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedemo/model/new_movies.dart';
import 'package:moviedemo/utils/common_widgets.dart';
import 'package:moviedemo/utils/constant_strings.dart';
import 'package:moviedemo/utils/style.dart';
import 'package:moviedemo/view/screens/detail_screen.dart';
import 'package:moviedemo/view_model/movie_view_model.dart';

//ignore: must_be_immutable
class HomeScreen extends ConsumerWidget {
  HomeScreen({this.name});

  String? name;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<NewMovies> movies = watch(movieStateFuture);
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
                    searchBar(),
                    categories(movies),
                    newMovies(movies)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ///app bar widget
  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomHeading(ConstantStrings.hello),

                Text(
                  '$name',
                  style: TextStyles.largeHeadline!.copyWith(
                    color: ColorStyles.grey,
                  ),
                ),
              ],
            ),
            CustomSubTitle(text: ConstantStrings.letsWatchToday,),
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
    );
  }

  ///search bar widget
  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: CustomTextFormField(
        hintText: ConstantStrings.search,
        prefixIcon: Icon(
          Icons.search,
          color: ColorStyles.grey,
        ),
        suffixIcon: Icon(
          Icons.account_circle_sharp,
          color: ColorStyles.grey,
        ),
      ),
    );
  }

  ///categories widget
  Widget categories(NewMovies movies) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        children: [
          categoryHeading(),
          Container(
            height: 80,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: movies.items!.length,
              itemBuilder: (context, index) {
                return categoryDetails(movies);
              },
            ),
          )
        ],
      ),
    );
  }

  ///category heading widget
  Widget categoryHeading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomHeading(ConstantStrings.categories),
        CustomSubTitle(text: ConstantStrings.seeAll,),
      ],
    );
  }

  ///category details widget
  Widget categoryDetails(NewMovies movies) {
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
          ConstantStrings.comedy,
            style: TextStyles.subtitle!.copyWith(color: ColorStyles.grey),
          )
        ],
      ),
    );
  }

  ///movies widget
  Widget newMovies(NewMovies movies) {
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

  ///movies heading widget
  Widget newMoviesHeading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomHeading(ConstantStrings.newMovies),
        CustomSubTitle(text: ConstantStrings.seeAll,),
      ],
    );
  }

  ///movie details widget
  Widget newMoviesDetails(NewMovies movies, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(movies, index),
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
                  fit: BoxFit.fill,
                ),
              ),
              height: 210,
              width: 160,
            ),
            SizedBox(
              height: 5,
            ),
            CustomTitle(text: movies.items![index].title!,),
            CustomSubTitle(text: movies.items![index].fullTitle!,),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: ColorStyles.yellow,
                ),
                SizedBox(
                  width: 5,
                ),
                CustomSubTitle(text: movies.items![index].imDbRating!,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedemo/model/new_movies.dart';
import 'package:moviedemo/model/recommended_movies.dart';
import 'package:moviedemo/utils/common_widgets/moviedemo_image.dart';
import 'package:moviedemo/utils/common_widgets/moviedemo_title.dart';
import 'package:moviedemo/utils/constant_strings.dart';
import 'package:moviedemo/utils/style.dart';
import 'package:moviedemo/view/widgets/recommended.dart';
import 'package:moviedemo/view_model/recommendedmovies_view_model.dart';

class DetailScreen extends ConsumerWidget {
  final NewMovies? movies;
  final int index;

  DetailScreen(this.movies, this.index);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<RecommendedMovies> recommendedMovies =
        watch(recommendedStateFuture);

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: recommendedMovies.when(
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) => Center(
          child: Text('${err.toString()}'),
        ),
        data: (recommendedMovies) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ///top screen widget
                    topScreen(context),
                    ///bottom screen widget
                    bottomScreen(context),
                    ///between screen stack widget
                    betweenScreen(context),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 2, 0),
                  child: bottomScreenDetails(recommendedMovies, context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ///between screen stack widget
  Widget betweenScreen(BuildContext context) {
    return Positioned(
                    bottom: -18,
                    left: 40,
                    child: Container(
                      width: 180,
                      height: MediaQuery.of(context).size.height / 3,
                      child: MovieDemoImage(
                        image: movies!.items![index].image!,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  );
  }

  ///bottom screen widget
  Widget bottomScreen(BuildContext context) {
    return Positioned(
                    top: MediaQuery.of(context).size.height / 2.3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                  );
  }

  ///top screen widget
  Widget topScreen(BuildContext context) {
    return Container(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 35,
                        ),

                        //This is for appBar Icons
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: ColorStyles.white,
                              ),
                            ),
                            Icon(
                              Icons.favorite_outline_rounded,
                              color: ColorStyles.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new NetworkImage(
                          movies!.items![index].image!,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
  }

  //bottom screen details widget
  Widget bottomScreenDetails(
      RecommendedMovies recommendedMovies, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 5, left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: MovieDemoTitle(
                  text: movies!.items![index].fullTitle!,
                  style: TextStyles.largeHeadline!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'WorksSans',
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                MovieDemoTitle(
                  text: movies!.items![index].title!,
                  style: TextStyles.labelName!.copyWith(
                    color: ColorStyles.dark_grey,
                    fontFamily: 'WorksSans',
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                MovieDemoTitle(
                  text: ConstantStrings.time,
                  style: TextStyles.labelName!.copyWith(
                    color: ColorStyles.dark_grey,
                    fontFamily: 'WorksSans',
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: ColorStyles.yellow,
              ),
              SizedBox(
                width: 20,
              ),
              MovieDemoTitle(
                text: movies!.items![index].imDbRating!,
                style: TextStyles.labelName!.copyWith(
                  color: ColorStyles.dark_grey,
                  fontFamily: 'WorksSans',
                ),
              ),
            ],
          ),

          ///overview details widget
          overviewDetails(context),

          ///recommended widget
          recommended(recommendedMovies, context)
        ],
      ),
    );
  }

  //overview detail widget
  Widget overviewDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieDemoTitle(
            text: ConstantStrings.overview,
            style: TextStyles.largeHeadline!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: 'WorksSans',
                color: Theme.of(context).accentColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MovieDemoTitle(
              text: ConstantStrings.wikipedia,
              style: TextStyles.labelName!.copyWith(
                color: ColorStyles.dark_grey,
                fontFamily: 'WorksSans',
              ),
              maxLine: 4,
            ),
          )
        ],
      ),
    );
  }

  //recommended widget
  Widget recommended(
      RecommendedMovies recommendedMovies, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDemoTitle(
          text: ConstantStrings.recommended,
          style: TextStyles.largeHeadline!.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: 'WorksSans',
              color: Theme.of(context).accentColor),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 300,
          child: Recommended(),
        ),
      ],
    );
  }
}

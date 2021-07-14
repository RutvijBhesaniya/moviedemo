import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedemo/model/new_movies.dart';
import 'package:moviedemo/model/recommended_movies.dart';
import 'package:moviedemo/utils/common_widgets.dart';
import 'package:moviedemo/utils/constant_strings.dart';
import 'package:moviedemo/utils/style.dart';
import 'package:moviedemo/view/widgets/recommended.dart';
import 'package:moviedemo/view_model/movie_view_model.dart';

//ignore: must_be_immutable
class DetailScreen extends ConsumerWidget {
  NewMovies? movies;
  int index;

  DetailScreen(this.movies, this.index);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<RecommendedMovies> recommendedMovies =
        watch(recommendedStateFuture);

    final screenHeight = MediaQuery.of(context).size.height;

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
                  children: [
                    ///top screen widget
                    _topScreen(context),
                    Positioned(
                      top: 300,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                              color: Theme.of(context).canvasColor,
                            ),
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                    //between screen stack widget
                    _betweenScreen(screenHeight, context),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 15, 0),
                  child: bottomScreen(recommendedMovies, context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ///between screen stack widget
  Widget _betweenScreen(double screenHeight, BuildContext context) {
    return Positioned(
      top: screenHeight * (3 / 9) - 230 / 3,
      width: 150,
      left: 50,
      child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: CustomImage(
            image: movies!.items![index].image!,
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }

  ///top screen widget
  Widget _topScreen(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 25,
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
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new NetworkImage(
            movies!.items![index].image!,
          ),
          fit: BoxFit.fill,
        ),
      ),
      height: 330,
      width: MediaQuery.of(context).size.width,
    );
  }

  //bottom screen widget
  Widget bottomScreen(
      RecommendedMovies recommendedMovies, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: CustomTitle(
                text: movies!.items![index].fullTitle!,
                style: TextStyles.smallHeadline!.copyWith(
                  fontWeight: FontWeight.bold,
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
              CustomTitle(
                text: movies!.items![index].title!,
                style: TextStyles.labelName!
                    .copyWith(color: ColorStyles.dark_grey),
              ),
              SizedBox(
                width: 20,
              ),
              CustomTitle(
                text: ConstantStrings.time,
                style: TextStyles.labelName!
                    .copyWith(color: ColorStyles.dark_grey),
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
            CustomTitle(
              text: movies!.items![index].imDbRating!,
              style:
                  TextStyles.labelName!.copyWith(color: ColorStyles.dark_grey),
            ),
          ],
        ),
        overviewDetails(context),
        recommended(recommendedMovies, context)
      ],
    );
  }

  //bottom screen detail widget
  Widget overviewDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitle(
            text: ConstantStrings.overview,
            style: TextStyles.largeHeadline!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTitle(
            text: ConstantStrings.wikipedia,
            style: TextStyles.labelName!.copyWith(color: ColorStyles.dark_grey),
            maxLine: 4,
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
        CustomTitle(
          text: ConstantStrings.recommended,
          style: TextStyles.largeHeadline!.copyWith(
              fontWeight: FontWeight.bold,
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

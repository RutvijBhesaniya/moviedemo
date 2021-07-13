import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedemo/model/new_movies.dart';
import 'package:moviedemo/model/recommended_movies.dart';
import 'package:moviedemo/utils/common_widgets.dart';
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
      backgroundColor: ColorStyles.white,
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
                    Container(
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
                    ),
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
                              color: Colors.white,
                            ),
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                    //This is Container used as Stack to set the Image in between
                    Positioned(
                      top: screenHeight * (3 / 9) - 240 / 2,
                      width: 150,
                      left: 50,
                      child: Container(
                        height: 290,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new NetworkImage(
                              movies!.items![index].image!,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 15, 0),
                  child: bottomScreen(recommendedMovies),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  //bottom screen widget
  Widget bottomScreen(RecommendedMovies recommendedMovies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: CustomHeading(
                movies!.items![index].fullTitle!,
              ),
              // child: Text(
              //    movies!.items![index].fullTitle!,
              //   style: TextStyles.largeHeadline!.copyWith(
              //     fontWeight: FontWeight.bold,
              //   ),
              //   overflow: TextOverflow.ellipsis,
              // ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CustomSubTitle(movies!.items![index].title!),
            // Text(
            //   movies!.items![index].title!,
            //   overflow: TextOverflow.ellipsis,
            //   style: TextStyles.labelName!.copyWith(
            //     color: ColorStyles.grey,
            //   ),
            // ),
            SizedBox(
              width: 20,
            ),
            CustomSubTitle('1hr 50min'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.star,color: ColorStyles.yellow,
            ),
            SizedBox(
              width: 20,
            ),
            CustomSubTitle(movies!.items![index].imDbRating!),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        overviewDetails(),
        SizedBox(
          height: 20,
        ),
        // recommendedHeading(),
        // SizedBox(height: 10,),
        recommended(recommendedMovies)
      ],
    );
  }

  //bottom screen detail widget
  Widget overviewDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeading('Overview'),
        SizedBox(
          height: 10,
        ),
        Text(
          'Wikipedia is a free, open content online encyclopedia created through the collaborative effort of a community of users known as Wikipedians. Anyone registered on the site can create an article for publication; registration is not required to edit articles.',
          style: TextStyles.labelName!.copyWith(
            fontSize: 15,
            color: ColorStyles.grey,
          ),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }

  //recommended widget
  Widget recommended(RecommendedMovies recommendedMovies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeading('Recommended'),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 300,
          child: Recommended(),
        ),
      ],
    );
  }
}

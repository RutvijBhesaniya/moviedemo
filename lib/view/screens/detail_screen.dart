import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedemo/model/new_movies.dart';
import 'package:moviedemo/model/recommended_movies.dart';
import 'package:moviedemo/utils/style.dart';
import 'package:moviedemo/view/widgets/recommended.dart';
import 'package:moviedemo/view_model/movie_view_model.dart';

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

  //This is for BottomScreen
  Widget bottomScreen(RecommendedMovies recommendedMovies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                movies!.items![index].fullTitle!,
                style: TextStyles.largeHeadline!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              movies!.items![index].title!,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.labelName!.copyWith(
                color: ColorStyles.grey,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              '1 hr 55m',
              style: TextStyles.labelName!.copyWith(
                color: ColorStyles.grey,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.star,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              movies!.items![index].imDbRating!,
              style: TextStyles.labelName!.copyWith(
                color: ColorStyles.grey,
              ),
            )
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

  //This is for BottomDetails
  Widget overviewDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: TextStyles.smallHeadline!.copyWith(
            color: ColorStyles.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Wikipedia is a free, open content online encyclopedia created through the collaborative effort of a community of users known as Wikipedians. Anyone registered on the site can create an article for publication; registration is not required to edit articles.',
          style: TextStyles.labelName!.copyWith(
            color: ColorStyles.grey,
          ),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }

  //Recommended
  Widget recommended(RecommendedMovies recommendedMovies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended',
          style: TextStyles.smallHeadline!.copyWith(
            color: ColorStyles.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 300,
          child: Recommended()
          // ListView.builder(
          //   shrinkWrap: true,
          //   scrollDirection: Axis.horizontal,
          //   itemCount: recommendedMovies.items!.length,
          //   itemBuilder: (context, index) {
          //     return recommendedDetails(recommendedMovies);
          //   },
          // ),
        ),
      ],
    );
  }

}

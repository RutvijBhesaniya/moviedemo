import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedemo/model/recommended_movies.dart';
import 'package:moviedemo/utils/common_widgets/moviedemo_image.dart';
import 'package:moviedemo/utils/common_widgets/moviedemo_title.dart';
import 'package:moviedemo/utils/style.dart';
import 'package:moviedemo/view_model/recommendedmovies_view_model.dart';

class Recommended extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<RecommendedMovies> recommendedMovies =
        watch(recommendedStateFuture);
    return recommendedMovies.when(
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) => Center(
        child: Text('${err.toString()}'),
      ),
      data: (
        recommendedMovies,
      ) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                height: 300,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedMovies.items!.length,
                  itemBuilder: (context, index) {
                    return recommendedDetails(
                        recommendedMovies, index, context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ///recommended detail widget
  Widget recommendedDetails(
      RecommendedMovies recommendedMovies, int index, BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.fromLTRB(0, 8, 12, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            height: 210,
            width: 160,
            child: MovieDemoImage(
              image: recommendedMovies.items![index].image!,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          MovieDemoTitle(
            text: recommendedMovies.items![index].fullTitle!,
            style: TextStyles.smallHeadline!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
            ),
          ),
          MovieDemoTitle(
            text: recommendedMovies.items![index].title!,
            style: TextStyles.labelName!.copyWith(color: ColorStyles.dark_grey),
          ),
          MovieDemoTitle(
            text: recommendedMovies.items![index].directors!,
            style: TextStyles.labelName!.copyWith(color: ColorStyles.dark_grey),
          ),
        ],
      ),
    );
  }
}

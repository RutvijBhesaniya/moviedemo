import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedemo/model/recommended_movies.dart';
import 'package:moviedemo/utils/style.dart';
import 'package:moviedemo/view_model/movie_view_model.dart';

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
                      return recommendedDetails(recommendedMovies, index);
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget recommendedDetails(RecommendedMovies recommendedMovies, int index) {
    return Container(
      width: 180,
      margin: const EdgeInsets.fromLTRB(0, 8, 12, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: new DecorationImage(
                image: new NetworkImage(
                  recommendedMovies.items![index].image!,
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
          Flexible(
            child: Text(
              recommendedMovies.items![index].fullTitle!,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.labelName!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            child: Text(
              recommendedMovies.items![index].title!,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.subhead.copyWith(
                color: ColorStyles.grey,
              ),
            ),
          ),
          Text(
            recommendedMovies.items![index].directors!,
            style: TextStyles.subhead.copyWith(
              color: ColorStyles.grey,
            ),
          )
        ],
      ),
    );
  }
}

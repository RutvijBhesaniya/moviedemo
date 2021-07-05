import 'package:flutter/material.dart';
import 'package:moviedemo/utils/style.dart';

class NewMovies extends StatefulWidget {
  const NewMovies({Key? key}) : super(key: key);

  @override
  _NewMoviesState createState() => _NewMoviesState();
}

class _NewMoviesState extends State<NewMovies> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        newMoviesHeading(),
        SizedBox(
          height: 15,
        ),
        newMoviesBody(),
      ],
    );
  }

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

  Widget newMoviesBody() {
    return Container(
      width: double.infinity,
      height: 280,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: new BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 210,
                width: 160,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'The Ivory Game',
                style: TextStyles.labelName!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Documentor',
                style: TextStyles.subhead.copyWith(
                  color: ColorStyles.grey,
                ),
              ),
              Text(
                'Rating',
                style: TextStyles.subhead.copyWith(
                  color: ColorStyles.grey,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

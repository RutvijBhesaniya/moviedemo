import 'package:flutter/material.dart';
import 'package:moviedemo/model/movie.dart';
import 'package:moviedemo/utils/style.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.movies, required this.index})
      : super(key: key);
  Movie movies;
  int index;

  @override
  _DetailScreenState createState() =>
      _DetailScreenState(this.movies, this.index);
}

class _DetailScreenState extends State<DetailScreen> {
  Movie movies;
  int index;

  _DetailScreenState(this.movies, this.index);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
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
                          vertical: 20, horizontal: 25),
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
                      image: new NetworkImage(movies.items![index].image!
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
                            color: Colors.white),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: screenHeight * (3 / 9) - 240 / 2,
                  width: 150,
                  left: 50,
                  child: Container(
                    height: 290,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new NetworkImage(
                            movies.items![index].image!,
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 15, 0),
              child: bottomScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                movies.items![index].fullTitle!,
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
              movies.items![index].title!,
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
            Icon(Icons.star),
            SizedBox(
              width: 20,
            ),
            Text(
              movies.items![index].imDbRating!,
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
        recommended()
      ],
    );
  }

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
          style: TextStyles.labelName!.copyWith(color: ColorStyles.grey),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }

  Widget recommended() {
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
          width: double.infinity,
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tempList().length,
            itemBuilder: (context, index) {
              return recommendedDetails();
            },
          ),
        ),
      ],
    );
  }

  Widget recommendedDetails() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 12, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            height: 210,
            width: 160,
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
    );
  }
}

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

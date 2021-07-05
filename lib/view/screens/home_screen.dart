import 'package:flutter/material.dart';
import 'package:moviedemo/utils/style.dart';
import 'package:moviedemo/view/widgets/categories.dart';
import 'package:moviedemo/view/widgets/new_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Column(
            children: [
              appBar(),
              SizedBox(
                height: 20,
              ),
              searchBar(),
              SizedBox(height: 20,),
              Categories(),
              NewMovies(),
            ],
          ),
        ),
      ),
    );
  }

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

  Widget searchBar() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Search',labelStyle: TextStyle(color: ColorStyles.grey),
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
}

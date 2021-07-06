import 'package:flutter/material.dart';
import 'package:moviedemo/utils/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Column(
              children: [
                appBar(),
                SizedBox(
                  height: 20,
                ),
                searchBar(),
                SizedBox(
                  height: 20,
                ),
                categories(),
                SizedBox(
                  height: 28,
                ),
                newMovies()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar()
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
          hintText: 'Search',
          hintStyle: TextStyle(color: ColorStyles.grey),
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

  Widget categories() {
    return Column(
      children: [
        categoryHeading(),
        Container(
          height: 80,
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tempList().length,
            itemBuilder: (context, index) {
              return categoryBody();
            },
          ),
        )
      ],
    );
  }

  Widget categoryHeading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Categories',
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

  Widget categoryBody() {
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
                  'assets/images/smiley.png',
                ),
              ),
            ),
          ),
          Text(
            'Comedy',
            style: TextStyles.subtitle!.copyWith(color: ColorStyles.grey),
          )
        ],
      ),
    );
  }

  Widget newMovies() {
    return Column(
      children: [
        newMoviesHeading(),
        Container(
          height: 300,
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tempList().length,
            itemBuilder: (context, index) {
              return newMoviesBody();
            },
          ),
        )

        // newMoviesBody(),
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

  Widget bottomNavigationBar(){
    return BottomNavigationBar(
       currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color: ColorStyles.grey,),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_media_sharp,color: ColorStyles.grey,),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline_rounded,color: ColorStyles.grey,),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_sharp,color: ColorStyles.grey,),
          title: Text(''),
        ),
      ],
    );
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
}

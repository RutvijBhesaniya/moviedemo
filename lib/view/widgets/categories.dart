import 'package:flutter/material.dart';
import 'package:moviedemo/utils/style.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        categoryHeading(),
        categoryBody(),
        Container(
          height: 60,
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

  List<String> tempList() => [
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 40,
        color: Colors.grey,
      ),
    );
  }
}

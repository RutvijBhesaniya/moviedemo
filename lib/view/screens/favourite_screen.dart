import 'package:flutter/material.dart';
import 'package:moviedemo/utils/common_widgets/custom_title.dart';
import 'package:moviedemo/utils/constant_strings.dart';
import 'package:moviedemo/utils/style.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomTitle(
        text: ConstantStrings.favouriteScreen,
        style: TextStyles.smallHeadline!.copyWith(
          fontWeight: FontWeight.bold,
          fontFamily: 'WorksSans',
          color: Theme.of(context).accentColor,
        ),
      )),
    );
  }
}

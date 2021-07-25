import 'package:flutter/material.dart';
import 'package:moviedemo/utils/common_widgets/moviedemo_title.dart';
import 'package:moviedemo/utils/constant_strings.dart';
import 'package:moviedemo/utils/style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: MovieDemoTitle(
        text: ConstantStrings.profileScreen,
        style: TextStyles.smallHeadline!.copyWith(
          fontWeight: FontWeight.bold,fontFamily: 'WorksSans',
          color: Theme.of(context).accentColor,
        ),
      )),
    );
  }
}

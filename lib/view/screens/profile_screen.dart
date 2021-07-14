import 'package:flutter/material.dart';
import 'package:moviedemo/utils/common_widgets.dart';
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
          child: CustomTitle(
        text: ConstantStrings.profileScreen,
        style: TextStyles.smallHeadline!.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).accentColor,
        ),
      )),
    );
  }
}

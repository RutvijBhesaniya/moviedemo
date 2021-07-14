import 'package:flutter/material.dart';
import 'package:moviedemo/utils/common_widgets.dart';
import 'package:moviedemo/utils/constant_strings.dart';

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
        child: CustomHeading(ConstantStrings.profileScreen)
      ),
    );
  }
}

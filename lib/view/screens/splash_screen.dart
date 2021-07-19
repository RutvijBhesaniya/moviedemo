import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moviedemo/utils/style.dart';
import 'package:moviedemo/view/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyles.yellow,
        body: Center(
          child: Container(
            child: CircleAvatar(
              backgroundColor: ColorStyles.white,
              radius: 50,
              child: Icon(
                Icons.movie,
                color: Colors.red,
              ),
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      ),
    );
  }
}

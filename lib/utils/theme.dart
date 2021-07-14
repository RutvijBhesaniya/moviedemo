import 'package:flutter/material.dart';
import 'package:moviedemo/utils/style.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        canvasColor: ColorStyles.white,
        accentColor: ColorStyles.black,


      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        canvasColor: ColorStyles.black,
        accentColor: ColorStyles.white,
      );
}

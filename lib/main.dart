import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedemo/utils/theme.dart';
import 'package:moviedemo/view/screens/login_screen.dart';
import 'package:moviedemo/view/screens/splash_screen.dart';


void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Movies Demo',
      themeMode:ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: SplashScreen(),
    );
  }
}

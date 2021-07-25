import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/utils/theme.dart';
import 'package:moviedemo/view/screens/splash_screen.dart';
import 'package:moviedemo/view_model/language_change_view_model.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final localProvider = StateNotifierProvider((ref) => LanguageChange('en'));

    final checkLanguage = watch(localProvider);

    return MaterialApp(
      locale: Locale(checkLanguage),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      debugShowCheckedModeBanner: false,
      title: 'Movies Demo',
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: SplashScreen(),
    );
  }
}

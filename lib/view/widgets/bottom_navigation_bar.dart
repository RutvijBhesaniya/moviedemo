import 'package:flutter/material.dart';
import 'package:moviedemo/utils/style.dart';
import 'package:moviedemo/view_model/bottomnavigationbar_view_model.dart';
import 'package:provider/provider.dart';

class BottomNavigationBars extends StatefulWidget {
  BottomNavigationBars({Key? key, this.name}) : super(key: key);
  final String? name;

  @override
  _BottomNavigationBarsState createState() =>
      _BottomNavigationBarsState(name: name);
}

class _BottomNavigationBarsState extends State<BottomNavigationBars> {
  _BottomNavigationBarsState({this.name});

  String? name;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavigationBarModel>(
      create: (context) => BottomNavigationBarModel(username: name),
      child: Consumer<BottomNavigationBarModel>(
        builder: (context, model, child) => Scaffold(
          body: model.currentScreen,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: ColorStyles.red,
            unselectedItemColor: ColorStyles.grey,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ' '),
              BottomNavigationBarItem(icon: Icon(Icons.shop), label: ' '),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline_rounded), label: ' '),
              BottomNavigationBarItem(
                  icon: Icon(Icons.water_damage_outlined), label: ' ')
            ],
            currentIndex: model.currentTab,
            onTap: (int index) {
              model.currentTab = index;
              print(model.currentTab);
            },
          ),
        ),
      ),
    );
  }
}

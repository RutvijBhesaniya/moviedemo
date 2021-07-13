import 'package:flutter/material.dart';
import 'package:moviedemo/utils/style.dart';
import 'package:moviedemo/view_model/movie_view_model.dart';
import 'package:provider/provider.dart';

class BottomNavigationBars extends StatefulWidget {
  const BottomNavigationBars({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarsState createState() => _BottomNavigationBarsState();
}

class _BottomNavigationBarsState extends State<BottomNavigationBars> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavigationBarModel>(
      create: (context) => BottomNavigationBarModel(),
      child: Consumer<BottomNavigationBarModel>(
        builder: (context, model, child) => Scaffold(
          body: model.currentScreen,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: ColorStyles.red,
            unselectedItemColor: ColorStyles.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label:'Home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: 'Media'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_rounded),
                label: 'Favourite'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.water_damage_outlined),
                label: 'Profile'
              )
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

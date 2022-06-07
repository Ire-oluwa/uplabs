import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uplabs/pages/favourite_page.dart';
import 'package:uplabs/pages/home_page.dart';
import 'package:uplabs/services/buttom_navigation_provider.dart';
import 'package:uplabs/utilities/constants.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = 'BottomNavBar';

  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List _currentScreen = [
    const HomePage(),
    const FavouritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentScreen[
          Provider.of<ButtomNavigationBar>(context).currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<ButtomNavigationBar>(context, listen: false)
            .currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: kThemeColour,
        onTap: (index) {
          Provider.of<ButtomNavigationBar>(context, listen: false)
              .currentIndex = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            label: 'Favourite',
            activeIcon: Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uplabs/pages/bottom_nav_bar.dart';
import 'package:uplabs/pages/favourite_page.dart';
import 'package:uplabs/pages/home_page.dart';
import 'package:uplabs/pages/trending.dart';
import 'package:uplabs/pages/world_page.dart';
import 'package:uplabs/utilities/constants.dart';

import 'services/buttom_navigation_provider.dart';

void main() => runApp(
      ChangeNotifierProvider<ButtomNavigationBar>(
          create: (BuildContext context) => ButtomNavigationBar(),
          child: const MyApp()),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: BottomNavBar.id,
      routes: {
        BottomNavBar.id: (context) => const BottomNavBar(),
        FavouritePage.id: (context) => const FavouritePage(),
        HomePage.id: (context) => const HomePage(),
        WorldPage.id: (context) => const WorldPage(),
        TrendingNews.id: (context) => const TrendingNews(),
      },
      theme: ThemeData(
        primaryColor: kThemeColour,
      ),
    );
  }
}
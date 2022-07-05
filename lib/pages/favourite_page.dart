import 'package:flutter/material.dart';
import 'package:uplabs/utilities/constants.dart';

class FavouritePage extends StatefulWidget {
  static const String id = 'FavouritePage';

  const FavouritePage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List favourite = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kThemeColour,
        title: const Text(
          'Favourites',
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return const ListTile();
        },
      ),
    );
  }
}

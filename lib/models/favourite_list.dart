import 'package:flutter/material.dart';
import 'package:uplabs/database/favourite_database.dart';
import 'package:uplabs/models/favourite.dart';

class FavouriteList extends ChangeNotifier {
  late final Favourite favourite;
  late final List<Favourite> _favourites = [];

  List<Favourite> get favourites => _favourites;

  void addToFavourites(FavouriteDatabase favouriteDatabase) {
    notifyListeners();
  }
}

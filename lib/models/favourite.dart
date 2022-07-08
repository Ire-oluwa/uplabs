const String tableFavourites = 'favourite';

class FavouriteField {
  static const String id = '_id';
  static const String imageUrl = 'imageUrl';
  static const String title = 'title';
  static const String description = 'description';
}

class Favourite {
  final int? id;
  final String imageUrl;
  final String title;
  final String description;

  const Favourite({
    this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

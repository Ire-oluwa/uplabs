const String tableFavourites = 'favourite';

//for the column/field of the database.
class FavouriteField {
  static const List<String> values = [
    id,
    imageUrl,
    title,
    description,
  ];

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
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  //how the field of the database should be read.
  static Favourite fromJson(Map<String, Object?> json) => Favourite(
        id: json[FavouriteField.id] as int?,
        imageUrl: json[FavouriteField.imageUrl] as String,
        title: json[FavouriteField.title] as String,
        description: json[FavouriteField.description] as String,
      );

  //from the class property, defines how to write to the database.
  Map<String, Object?> toJson() => {
        FavouriteField.id: id,
        FavouriteField.imageUrl: imageUrl,
        FavouriteField.title: title,
        FavouriteField.description: description,
      };

  //needed when a database is to be edited/updated.
  Favourite copy(
          {int? id, String? imageUrl, String? title, String? description}) =>
      Favourite(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
      );
}

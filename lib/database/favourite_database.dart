import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uplabs/models/favourite.dart';

class FavouriteDatabase {
  static final FavouriteDatabase instance = FavouriteDatabase.instance;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('favourites.db');
    return _database!;
  }

  //to initialize database and store the database file in the device's storage.
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return openDatabase(path, version: 1, onCreate: _createDB);
  }

  //to  create the field of the database.
  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute(
      '''
      CREATE TABLE $tableFavourites(
      ${FavouriteField.id} $idType,
      ${FavouriteField.imageUrl} $textType,
      ${FavouriteField.title} $textType,
      ${FavouriteField.description} $textType,
      ),
    ''',
    );
  }

  //to  insert the columns of the field.
  Future<Favourite> create(Favourite favourite) async {
    final db = await instance.database;
    final id = await db.insert(tableFavourites, favourite.toJson());
    return favourite.copy(id: id);
  }

  Future<Favourite> readFavourite(int id) async {
    final db = await instance.database;
    final maps = await db.query(tableFavourites,
        columns: FavouriteField.values,
        where: '${FavouriteField.id} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Favourite.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Favourite>> readAllFavourite() async {
    final db = await instance.database;
    final result = await db.query(tableFavourites);
    return result.map((json) => Favourite.fromJson(json)).toList();
  }

  Future update(Favourite favourite) async {
    final db = await instance.database;
    return await db.update(
      tableFavourites,
      favourite.toJson(),
      where: '${FavouriteField.id} = ?',
      whereArgs: [favourite.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableFavourites,
      where: '${FavouriteField.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

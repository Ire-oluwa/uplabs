import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uplabs/models/favourite.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase.instance;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('favourites.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return openDatabase(path, version: 1, onCreate: _createDB);
  }

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

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

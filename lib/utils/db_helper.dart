import 'dart:io';
import 'package:deal_app/model/advert.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';



class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "advert_database.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE adverts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        fotoPath TEXT,
        description TEXT,
        price INTEGER,
        location TEXT,
        category TEXT,
        phoneNumber INTEGER,
        status TEXT
      )
    ''');
  }

  Future<int> insertIlan(Advert ilan) async {
    Database db = await database;
    return await db.insert('ilanlar', ilan.toMap());
  }

  Future<List<Advert>> getIlanlar() async {
    Database db = await database;
    List<Map<String, dynamic>> ilanlarMapList = await db.query('adverts');
    return ilanlarMapList.map((map) => Advert.fromMap(map)).toList();
  }


}

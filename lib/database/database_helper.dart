import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'history_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await initDatabase();

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'historyDatabase.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE History (
        ID TEXT NOT NULL UNIQUE,
        Date TEXT,
        Problem_String TEXT,
        Solution TEXT
      )
    ''',
    );
  }

  Future<List<HistoryModel>> getData() async {
    Database db = await instance.database;
    var dbData = await db.query('Tasks');
    List<HistoryModel> dataFromDB = dbData.isNotEmpty
        ? dbData.map((c) => HistoryModel.fromMap(c)).toList()
        : [];
    return dataFromDB;
  }

  Future<int> addIntoDatabase(HistoryModel statement) async {
    Database db = await instance.database;
    return await db.insert('ID', statement.toMap());
  }

  Future<int> deleteFromDatabase(HistoryModel statement) async {
    Database db = await instance.database;

    return await db.delete(
      'ID',
      where: 'ID = ? ',
      whereArgs: [
        statement.id,
      ],
    );
  }

  // Future<int> updateDatabase(History statement, History update) async {
  //   Database db = await instance.database;
  //   return await db.update('ID', update.toMap(),
  //       where: "ID = ?", whereArgs: [statement.id]);
  // }
}

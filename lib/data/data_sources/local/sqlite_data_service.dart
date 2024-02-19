import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:transmedia/data/models/cart_database_fields_model.dart';
import 'package:transmedia/data/models/cart_model.dart';

class SqliteService {
  static final SqliteService sqliteService = SqliteService._internal();

  static Database? _database;

  SqliteService._internal();
  static const String _databaseName = "database.db";

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$_databaseName';
    print('SqliteService._initDatabase');
    return await openDatabase(path, version: 1, onCreate: _createDatabase,singleInstance: true);
  }

  Future<void> _createDatabase(Database database, int version) async {
    print('SqliteService._createDatabase....');
    try {
      await database.execute("""
      CREATE TABLE ${CartFields.tableName} (
        ${CartFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${CartFields.title} TEXT NOT NULL,
        ${CartFields.qty} INTEGER NOT NULL,
        ${CartFields.price} REAL NOT NULL,
        ${CartFields.image} TEXT NOT NULL
      )
    """);
    } on Exception catch (e) {
      // TODO
      debugPrint('Local database error:$e');
      rethrow;
    }
  }

  Future<int> createItem(CartModel cartModel) async {
    try {
      final db = await sqliteService.database;
      final id = await db.insert(CartFields.tableName, cartModel.toJson());
      return id;
    } on Exception catch (e) {
      // TODO
      rethrow;
    }
  }

  Future<List<CartModel>> readAll() async {
    try {
      final db = await sqliteService.database;
      final result = await db.query(CartFields.tableName);
      return result.map((json) => CartModel.fromJson(json)).toList();
    } on Exception catch (e) {
      // TODO
      rethrow;
    }
  }

  Future<int> getCartCount() async {
    final db = await sqliteService.database;
    var x = await db.rawQuery('SELECT COUNT (*) from ${CartFields.tableName}');
        int? count = Sqflite.firstIntValue(x);
    return count??0;
  }

  Future<int> update(CartModel cartModel) async {
    final db = await sqliteService.database;
    return db.update(
      CartFields.tableName,
      cartModel.toJson(),
      where: '${CartFields.id} = ?',
      whereArgs: [cartModel.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await sqliteService.database;
    return await db.delete(
      CartFields.tableName,
      where: '${CartFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await sqliteService.database;
    db.close();
  }
}

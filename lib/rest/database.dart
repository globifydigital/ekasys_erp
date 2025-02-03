import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/products/products_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'ekasys.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE products(Id INTEGER PRIMARY KEY, itemId INTEGER, openqty INTEGER, stock INTEGER, itemCode TEXT, description TEXT, taxName TEXT, sellingPrice REAL, avgCost REAL, model1 NULL, model2 NULL, model3 NULL, active INTEGER, status TEXT, slno INTEGER, unitName TEXT, grpName TEXT, sbgrpName NULL, categoryName TEXT, subCategoryName NULL, groupId INTEGER, categoryId INTEGER, customerId INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertProduct(AllProducts product) async {
    final db = await database;
    await db.insert(
      'products',
      product.toDbJson(),
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<AllProducts>> getProductsByCustomerId(int customerId) async {
    final db = await database;
    final List<Map<String, dynamic>> queryResults  = await db.query(
      'products',
      where: 'customerId = ?',
      whereArgs: [customerId],
    );
    List<AllProducts> _products = queryResults.map((map) => AllProducts.fromdbJson(map)).toList();
    return _products;
  }

  Future<void> deleteSingleProduct(int customerId, int itemId) async {
    final db = await database;
    await db.delete(
      'products',
      where: 'customerId = ? AND itemId = ?',
      whereArgs: [customerId, itemId],
    );
  }

  Future<void> deleteProductsByCustomerId(int customerId) async {
    final db = await _initDatabase();
    await db.delete(
      'products',
      where: 'customerId = ?',
      whereArgs: [customerId],
    );
  }


  Future<void> deleteAllProducts() async {
    final db = await database;
    await db.delete('products');
  }
}

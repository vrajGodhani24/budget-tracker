import 'dart:typed_data';

import 'package:expence_tracker/module/views/homepage/model/fetch_category.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  String tableName = "category";
  Database? db;

  Future<Database?> initDB() async {
    String path = await getDatabasesPath();
    String databasePath = join(path, 'budget_tracker.db');

    db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) async {
        String sql =
            "CREATE TABLE IF NOT EXISTS $tableName(catId INTEGER PRIMARY KEY AUTOINCREMENT, catName TEXT, catImg BLOB)";

        await db.execute(sql);
      },
    );
    return db;
  }

  Future<void> insertCategory(
      String categoryName, Uint8List categoryImage) async {
    db = await initDB();

    String sql = "INSERT INTO $tableName (catName,catImg) VALUES(?,?)";
    List args = [categoryName, categoryImage];

    await db!.rawInsert(sql, args);
  }

  Future<List<FetchedCategory>> fetchCategoryAllData() async {
    db = await initDB();

    String sql = "SELECT * FROM $tableName";

    List<Map<String, Object?>> data = await db!.rawQuery(sql);

    List<FetchedCategory> fetchedData =
        data.map((e) => FetchedCategory(catName: "${e['catName']}")).toList();

    return fetchedData;
  }
}

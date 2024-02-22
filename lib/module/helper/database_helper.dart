import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  String tableName = "category";
  Database? db;

  initDB() async {
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
  }
}

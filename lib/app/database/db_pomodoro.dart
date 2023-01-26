import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbPomodoro {
  DbPomodoro._();
  static final DbPomodoro db = DbPomodoro._();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    String dp = await getDatabasesPath();
    String nameDB = 'pomodoro.db';
    String path = join(dp, nameDB);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int newVersion) async {
    List<String> queryes = [
      'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, userName TEXT NOT NULL, email TEXT NOT NULL UNIQUE, password TEXT NOT NULL)',
      'CREATE TABLE activities (id INTEGER PRIMARY KEY AUTOINCREMENT, idUser INTEGER NOT NULL, name TEXT NOT NULL, focusTime TEXT NOT NULL, breakTime TEXT NOT NULL, breakActivity TEXT NOT NULL)',
    ];

    for (String query in queryes) {
      await db.execute(query);
    }
  }

  Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await database;
    return await db!.query(table);
  }

  Future<List<Map<String, dynamic>>> getUser(
      String table, String email, String password) async {

    final db = await database;
    return await db!.query(
      table,
      where: "email = ? and password = ?",
      whereArgs: [email, password],
    );
  }

  Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    await db!.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> delete(String table, int id) async {
    final db = await database;
    await db!.delete(table, where: "id = ?", whereArgs: [id]);
  }

  Future<void> update(String table, int id, Map<String, dynamic> data) async {
    final db = await database;
    await db!.update(table, data, where: "id = ?", whereArgs: [id]);
  }
}

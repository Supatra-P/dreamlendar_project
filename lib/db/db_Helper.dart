import 'package:dreamlendar/models/task.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "userDetail";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'userDetail.db';
      _db =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        print("creating a new one");
        return db.execute(
          "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "title TEXT, startDate STRING, endDate STRING, "
          "startTime STRING, endTime STRING, repeat STRING, "
          "alert INTEGER, "
          "showAs STRING, note TEXT, "
          "color INTEGER, "
          "codeSee INTEGER)",
        );
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print("int function called");
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_tableName);
  }

  static delete(Task task) async {
    print("Delete id: ${task.id}");
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [task.id]);
  }
}

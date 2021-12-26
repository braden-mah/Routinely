import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RoutineDatabase {
  late final Database db;
  Future<void> initializeDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    db = await openDatabase(join(await getDatabasesPath(), 'routinely.db'),
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE routines(id INTEGER NOT NULL PRIMARY KEY, name TEXT NOT NULL, description TEXT NOT NULL)');
    }, version: 1);
  }
}

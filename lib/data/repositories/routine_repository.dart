import 'package:routinely/core/database.dart';
import 'package:routinely/data/mappers/routine_mapper.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:sqflite/sqflite.dart';

class RoutineRepository {
  final RoutineDatabase _database;
  RoutineRepository(this._database);

  Future<bool> addRoutine(Routine routine) async {
    int val = await _database.db.insert(
        'routines', RoutineMapper.toMap(routine),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return (val != 0);
  }

  Future<bool> updateRoutine(int id, Routine routine) async {
    int entriesUpdated = await _database.db.update(
        'routines', RoutineMapper.toMap(routine),
        where: 'id = ?', whereArgs: [id]);
    return (entriesUpdated == 1);
  }

  Future<bool> deleteRoutine(int id) async {
    int rowsDeleted =
        await _database.db.delete('routines', where: 'id = ?', whereArgs: [id]);
    return (rowsDeleted == 1);
  }

  Future<List<Routine>> getAllRoutines() async {
    List<Map<String, dynamic>> dbMap = await _database.db.query('routines');
    return dbMap.map((el) => RoutineMapper.fromMap(el)).toList();
  }
}

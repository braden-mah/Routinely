import 'package:routinely/core/database.dart';
import 'package:routinely/data/mappers/routine_entry_mapper.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';
import 'package:sqflite/sqflite.dart';

class RoutineEntryRepository {
  final RoutineDatabase _database;
  RoutineEntryRepository(this._database);

  Future<bool> addRoutineEntry(RoutineEntry routineEntry) async {
    int val = await _database.db.insert(
        'entries', RoutineEntryMapper.toMap(routineEntry),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return val != 0;
  }

  Future<bool> deleteRoutineEntry(int id) async {
    int val =
        await _database.db.delete('entries', where: 'id = ?', whereArgs: [id]);
    return val == 1;
  }

  Future<List<RoutineEntry>> getAllRoutineEntries(int routineId) async {
    final rawData = await _database.db
        .query('entries', where: 'routineId = ?', whereArgs: [routineId]);
    return rawData.map((el) => RoutineEntryMapper.fromMap(el)).toList();
  }

  Future<bool> updateRoutineEntry(int id, RoutineEntry routineEntry) async {
    final map = RoutineEntryMapper.toMap(routineEntry);
    int val = await _database.db.rawUpdate(
        'UPDATE entries SET date = ?, note = ?, checkboxes = ? WHERE id = ?',
        [map['date'], map['note'], map['checkboxes'], id]);
    return val == 1;
  }
}

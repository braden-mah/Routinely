import 'package:routinely/data/repositories/routine_entry_repository.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';

class RoutineEntryService {
  final RoutineEntryRepository _routineEntryRepository;
  RoutineEntryService(this._routineEntryRepository);
  Future<bool> addRoutineEntry(RoutineEntry routineEntry) async {
    return await _routineEntryRepository.addRoutineEntry(routineEntry);
  }

  Future<bool> deleteRoutineEntry(int id) async {
    return await _routineEntryRepository.deleteRoutineEntry(id);
  }

  Future<bool> updateRoutineEntry(int id, RoutineEntry routineEntry) async {
    return await _routineEntryRepository.updateRoutineEntry(id, routineEntry);
  }

  Future<List<RoutineEntry>> getAllRoutineEntries(int routineId) async {
    return await _routineEntryRepository.getAllRoutineEntries(routineId);
  }
}

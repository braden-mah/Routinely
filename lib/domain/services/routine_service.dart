import 'package:routinely/data/repositories/routine_repository.dart';
import 'package:routinely/domain/entities/routine_entity.dart';

class RoutineService {
  final RoutineRepository _routineRepository;
  RoutineService(this._routineRepository);
  Future<bool> addRoutine(Routine routine) async {
    return await _routineRepository.addRoutine(routine);
  }

  Future<bool> deleteRoutine(int id) async {
    return await _routineRepository.deleteRoutine(id);
  }

  Future<bool> updateRoutine(int id, Routine routine) async {
    return await _routineRepository.updateRoutine(id, routine);
  }

  Future<List<Routine>> getAllRoutines() async {
    return await _routineRepository.getAllRoutines();
  }
}

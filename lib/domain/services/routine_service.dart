import 'package:routinely/domain/entities/routine_entity.dart';

abstract class RoutineService {
  Future<bool> addRoutine(Routine routine);
}

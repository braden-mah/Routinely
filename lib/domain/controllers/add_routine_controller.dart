import 'package:flutter/cupertino.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/services/routine_service.dart';

class AddRoutineController extends ChangeNotifier {
  final RoutineService _routineService;
  AddRoutineController(this._routineService);
  Future<void> addRoutine(String title, String description) async {
    Routine routine = Routine(title, description);
    bool isSuccessful = await _routineService.addRoutine(routine);
    if (isSuccessful) {
      return;
    }
    return;
  }
}

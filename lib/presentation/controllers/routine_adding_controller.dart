import 'package:flutter/cupertino.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/services/routine_service.dart';

class AddRoutineController extends ChangeNotifier {
  final RoutineService _routineService;
  late String name = '';
  late String description = '';
  late List<String> checkboxes = [];

  AddRoutineController(this._routineService);

  Future<void> handleSubmit(BuildContext context) async {
    bool successful = await addRoutine();
    if (successful) Navigator.pop(context);
  }

  Future<bool> addRoutine() async {
    Routine routine = Routine.noId(name, description, checkboxes);
    bool isSuccessful = await _routineService.addRoutine(routine);
    if (isSuccessful) {
      return true;
    }
    return false;
  }

  void addCheckbox() {
    checkboxes.add('');
    notifyListeners();
  }
}

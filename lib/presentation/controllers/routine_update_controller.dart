import 'package:flutter/cupertino.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/services/routine_service.dart';

class RoutineUpdateController extends ChangeNotifier {
  final RoutineService _routineService;
  late final int id;
  late String name;
  late String description;
  late List<String> checkboxes;
  RoutineUpdateController(this._routineService);

  void init(Routine routine) {
    id = routine.id!;
    name = routine.title;
    description = routine.description;
    checkboxes = routine.checkboxes;
  }

  void handleUpdate(BuildContext context) async {
    Routine routine = Routine.noId(name, description, checkboxes);
    await _routineService.updateRoutine(id, routine);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void addCheckbox() {
    checkboxes.add('');
    notifyListeners();
  }
}

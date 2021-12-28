import 'package:flutter/cupertino.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/services/routine_service.dart';

class RoutineUpdateController extends ChangeNotifier {
  final RoutineService _routineService;
  late final int id;
  late String name;
  late String description;
  RoutineUpdateController(this._routineService);

  void init(Routine routine) {
    id = routine.id!;
    name = routine.title;
    description = routine.description;
  }

  void handleUpdate(BuildContext context) async {
    Routine routine = Routine.withId(id, name, description);
    await _routineService.updateRoutine(id, routine);
    Navigator.pop(context);
    Navigator.pop(context);
  }
}

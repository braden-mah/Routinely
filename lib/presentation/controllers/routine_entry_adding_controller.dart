import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';
import 'package:routinely/domain/services/routine_entry_service.dart';

class RoutineEntryAddingController extends ChangeNotifier {
  final RoutineEntryService _routineEntryService;
  late DateTime? date;
  late String note;
  late List<String> checkboxes = [];
  late final Routine routine;

  RoutineEntryAddingController(this._routineEntryService);

  void init(Routine routine) {
    this.routine = routine;
    note = '';
    date = DateTime.now();
  }

  Future<void> addRoutineEntry(BuildContext context) async {
    RoutineEntry routineEntry =
        RoutineEntry.noId(routine.id!, note, date!, checkboxes);
    await _routineEntryService.addRoutineEntry(routineEntry);
  }

  void updateCheckbox(bool val, String name) {
    if (val) {
      checkboxes.add(name);
      return;
    }
    checkboxes.removeWhere((el) => el == name);
  }
}

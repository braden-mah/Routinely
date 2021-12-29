import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';
import 'package:routinely/domain/services/routine_entry_service.dart';

class RoutineEntryAddingController extends ChangeNotifier {
  final RoutineEntryService _routineEntryService;
  DateTime? date;
  late String note;
  late final Routine routine;

  RoutineEntryAddingController(this._routineEntryService);

  void init(Routine routine) {
    this.routine = routine;
    note = '';
    date = DateTime.now();
  }

  Future<void> addRoutineEntry(BuildContext context) async {
    RoutineEntry routineEntry = RoutineEntry.noId(routine.id!, note, date!);
    await _routineEntryService.addRoutineEntry(routineEntry);
  }
}

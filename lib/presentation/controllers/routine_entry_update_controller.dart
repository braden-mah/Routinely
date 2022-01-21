import 'package:flutter/cupertino.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';
import 'package:routinely/domain/services/routine_entry_service.dart';
import 'package:routinely/presentation/dto/routine_entry_viewing_dto.dart';

class RoutineEntryUpdateController extends ChangeNotifier {
  final RoutineEntryService _routineEntryService;
  late final Routine routine;
  late final int id;
  late DateTime date;
  late List<String> checkboxes;
  late String note;
  RoutineEntryUpdateController(this._routineEntryService);

  Future<void> init(RoutineEntryViewingDto dto) async {
    routine = dto.routine;
    date = dto.routineEntry.date;
    checkboxes = [...dto.routineEntry.checkboxes];
    note = dto.routineEntry.note;
    id = dto.routineEntry.id!;
  }

  void updateCheckbox(bool val, String name) {
    if (val) {
      checkboxes.add(name);
      return;
    }
    checkboxes.removeWhere((el) => el == name);
  }

  void updateRoutineEntry(BuildContext context) async {
    RoutineEntry routineEntry =
        RoutineEntry.noId(routine.id!, note, date, checkboxes);
    await _routineEntryService.updateRoutineEntry(id, routineEntry);
    Navigator.pop(context);
    Navigator.pop(context);
  }
}

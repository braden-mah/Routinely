import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';
import 'package:routinely/domain/services/routine_entry_service.dart';
import 'package:routinely/presentation/dto/routine_entry_viewing_dto.dart';
import 'package:routinely/presentation/view/routine_entry_update_page.dart';

class RoutineEntryViewingController extends ChangeNotifier {
  final RoutineEntryService _routineEntryService;
  late final Routine routine;
  late final RoutineEntry routineEntry;

  RoutineEntryViewingController(this._routineEntryService);

  void init(RoutineEntryViewingDto routineEntryViewingDto) {
    routine = routineEntryViewingDto.routine;
    routineEntry = routineEntryViewingDto.routineEntry;
  }

  void handleDelete(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Delete Entry?'),
        content: const Text('Are you sure you want to delete this entry?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('No')),
          TextButton(
              onPressed: () async {
                await _routineEntryService.deleteRoutineEntry(routineEntry.id!);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Yes'))
        ],
      ),
    );
  }

  void goToEntryUpdatePage(BuildContext context) {
    Navigator.pushNamed(context, RoutineEntryUpdatePage.route,
        arguments: RoutineEntryViewingDto(routine, routineEntry));
  }
}

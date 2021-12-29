import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';
import 'package:routinely/domain/services/routine_entry_service.dart';
import 'package:routinely/domain/services/routine_service.dart';
import 'package:routinely/presentation/view/routine_entry_adding_page.dart';
import 'package:routinely/presentation/view/routine_update_page.dart';

class RoutineViewingController extends ChangeNotifier {
  late final Routine routine;
  final RoutineService _routineService;
  final RoutineEntryService _routineEntryService;
  RoutineViewingController(this._routineService, this._routineEntryService);
  void init(Routine routine) async {
    this.routine = routine;
  }

  void handleDelete(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Delete ${routine.title}'),
        content: Text('Are you sure you want to delete ${routine.title}?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('No')),
          TextButton(
              onPressed: () async {
                await _routineService.deleteRoutine(routine.id!);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Yes'))
        ],
      ),
    );
  }

  void goToUpdatePage(BuildContext context) async {
    Navigator.pushNamed(context, RoutineUpdatePage.route, arguments: routine);
  }

  void goToAddEntryPage(BuildContext context) async {
    await Navigator.pushNamed(context, RoutineEntryAddingPage.route,
        arguments: routine);
    await getAllRoutineEntries();
  }

  Future<void> getAllRoutineEntries() async {
    List<RoutineEntry> routineEntries =
        await _routineEntryService.getAllRoutineEntries(routine.id!);
    print(routineEntries[1].id);
  }
}

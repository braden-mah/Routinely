import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';
import 'package:routinely/domain/services/routine_entry_service.dart';
import 'package:routinely/domain/services/routine_service.dart';
import 'package:routinely/presentation/dto/routine_entry_viewing_dto.dart';
import 'package:routinely/presentation/view/routine_entry_adding_page.dart';
import 'package:routinely/presentation/view/routine_entry_viewing_page.dart';
import 'package:routinely/presentation/view/routine_update_page.dart';

class RoutineViewingController extends ChangeNotifier {
  late final Routine routine;
  late List<RoutineEntry> routineEntries = [];
  final RoutineService _routineService;
  final RoutineEntryService _routineEntryService;
  RoutineViewingController(this._routineService, this._routineEntryService);
  void init(Routine routine) async {
    this.routine = routine;
    await getAllRoutineEntries();
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

  void goToEntryViewingPage(
      BuildContext context, RoutineEntry routineEntry) async {
    await Navigator.pushNamed(context, RoutineEntryViewingPage.route,
        arguments: RoutineEntryViewingDto(routine, routineEntry));
    await getAllRoutineEntries();
  }

  Future<void> getAllRoutineEntries() async {
    routineEntries =
        await _routineEntryService.getAllRoutineEntries(routine.id!);
    notifyListeners();
  }
}

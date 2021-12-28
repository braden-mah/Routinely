import 'package:flutter/cupertino.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/services/routine_service.dart';
import 'package:routinely/presentation/view/routine_adding_page.dart';
import 'package:routinely/presentation/view/routine_viewing_page.dart';

class RoutineViewingListingController extends ChangeNotifier {
  final RoutineService _routineService;
  List<Routine> routines = [];
  RoutineViewingListingController(this._routineService);

  void init() {
    getAllRoutines();
  }

  Future<void> goToAddRoutinePage(BuildContext context) async {
    await Navigator.pushNamed(context, RoutineAddingPage.route);
    await getAllRoutines();
  }

  Future<void> goToRoutineViewingPage(
      BuildContext context, Routine routine) async {
    await Navigator.pushNamed(context, RoutineViewingPage.route,
        arguments: routine);
    await getAllRoutines();
  }

  Future<void> getAllRoutines() async {
    routines = await _routineService.getAllRoutines();
    notifyListeners();
  }
}

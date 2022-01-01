import 'package:flutter/cupertino.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';
import 'package:routinely/presentation/dto/routine_entry_viewing_dto.dart';

class RoutineEntryViewingController extends ChangeNotifier {
  late final Routine routine;
  late final RoutineEntry routineEntry;
  void init(RoutineEntryViewingDto routineEntryViewingDto) {
    routine = routineEntryViewingDto.routine;
    routineEntry = routineEntryViewingDto.routineEntry;
  }
}

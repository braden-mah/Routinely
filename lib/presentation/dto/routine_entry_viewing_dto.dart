import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';

class RoutineEntryViewingDto {
  final Routine routine;
  final RoutineEntry routineEntry;
  RoutineEntryViewingDto(this.routine, this.routineEntry);
}

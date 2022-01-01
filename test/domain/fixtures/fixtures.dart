import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';

const List<Routine> routinesFixture = [
  Routine.noId('test 1', 'abc', []),
  Routine.noId('test 2', 'def', []),
  Routine.noId('test 3', 'ghi', []),
];

List<RoutineEntry> routineEntriesFixture = [
  RoutineEntry.withId(1, 1, 'test', DateTime.parse('0001-01-01'), []),
  RoutineEntry.withId(2, 1, 'test 2', DateTime.parse('2015-03-07'), []),
  RoutineEntry.withId(3, 1, 'test 3', DateTime.parse('1983-07-25'), []),
];

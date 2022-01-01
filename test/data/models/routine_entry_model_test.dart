import 'package:flutter_test/flutter_test.dart';
import 'package:routinely/data/mappers/routine_entry_mapper.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';

void main() {
  RoutineEntry routineEntry =
      RoutineEntry.noId(1, 'test', DateTime.parse('0001-01-01'), []);
  Map<String, dynamic> map = {
    'routineId': 1,
    'note': 'test',
    'date': '0001-01-01',
  };
  group('Routine entry mapper testing', () {
    test('Routine Entry to map', () {
      final result = RoutineEntryMapper.toMap(routineEntry);
      expect(result['routineId'], 1);
      expect(result['note'], 'test');
      expect(result['date'], '0001-01-01');
    });
    test('Map to Routine Entry', () {
      final result = RoutineEntryMapper.fromMap(map);
      expect(result.routineId, 1);
      expect(result.note, 'test');
      expect(result.date.year, 1);
      expect(result.date.month, 1);
      expect(result.date.day, 1);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:routinely/data/mappers/routine_mapper.dart';
import 'package:routinely/domain/entities/routine_entity.dart';

void main() {
  Routine routine = const Routine.noId('test 123', 'abc', ['a', 'b']);
  Map<String, dynamic> map = {'name': 'test 123', 'description': 'abc'};
  group('test mapping functionality of model', () {
    test('routine to map', () {
      final result = RoutineMapper.toMap(routine);
      expect(result['name'], routine.title);
      expect(result['description'], routine.description);
    });
    test('map to routine', () {
      final result = RoutineMapper.fromMap(map);
      expect(result.title, map['name']);
      expect(result.description, map['description']);
    });
  });
}

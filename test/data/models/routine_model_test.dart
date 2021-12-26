import 'package:flutter_test/flutter_test.dart';
import 'package:routinely/data/mappers/routine_mapper.dart';
import 'package:routinely/domain/entities/routine_entity.dart';

void main() {
  Routine routine = const Routine('test 123', 'abc');
  Map<String, dynamic> map = {'title': 'test 123', 'description': 'abc'};
  group('test mapping functionality of model', () {
    test('routine to map', () {
      final result = RoutineMapper.toMap(routine);
      expect(result['title'], routine.title);
      expect(result['description'], routine.description);
    });
    test('map to routine', () {
      final result = RoutineMapper.fromMap(map);
      expect(result.title, map['title']);
      expect(result.description, map['description']);
    });
  });
}

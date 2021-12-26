import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:routinely/data/repositories/routine_repository.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/domain/services/routine_service.dart';

import '../fixtures/fixtures.dart';
import 'routine_service_test.mocks.dart';

@GenerateMocks([RoutineRepository])
void main() {
  MockRoutineRepository routineRepository = MockRoutineRepository();
  Routine routine = const Routine("Test", 'ABC');
  RoutineService routineService = RoutineService(routineRepository);
  group('adding a routine', () {
    test('returns true if the routine is added successfully', () async {
      when(routineRepository.addRoutine(routine)).thenAnswer((_) async => true);
      final result = await routineService.addRoutine(routine);
      verify(routineRepository.addRoutine(routine));
      expect(result, true);
    });
    test('return false if the routine isn\'t added', () async {
      when(routineRepository.addRoutine(routine))
          .thenAnswer((_) async => false);
      final result = await routineService.addRoutine(routine);
      verify(routineRepository.addRoutine(routine));
      expect(result, false);
    });
  });
  group('deleting a routine', () {
    int id = 0;
    test('returns true if the routine is deleted successfully', () async {
      when(routineRepository.deleteRoutine(id)).thenAnswer((_) async => true);
      final result = await routineService.deleteRoutine(id);
      verify(routineRepository.deleteRoutine(id));
      expect(result, true);
    });
    test('return false if the routine is not deleted successfully', () async {
      when(routineRepository.deleteRoutine(id)).thenAnswer((_) async => false);
      final result = await routineService.deleteRoutine(id);
      verify(routineRepository.deleteRoutine(id));
      expect(result, false);
    });
  });
  group('getting all routines', () {
    test('returns a list of all routines', () async {
      when(routineRepository.getAllRoutines())
          .thenAnswer((_) async => routinesFixture);
      final List<Routine> result = await routineService.getAllRoutines();
      verify(routineRepository.getAllRoutines());
      expect(result.length, routinesFixture.length);
    });
  });
  group('updating a routine', () {
    int id = 1;
    test('update is successful', () async {
      when(routineRepository.updateRoutine(id, routine))
          .thenAnswer((_) async => true);
      final result = await routineRepository.updateRoutine(id, routine);
      verify(routineRepository.updateRoutine(id, routine));
      expect(result, true);
    });
    test('update fails', () async {
      when(routineRepository.updateRoutine(id, routine))
          .thenAnswer((_) async => false);
      final result = await routineRepository.updateRoutine(id, routine);
      verify(routineRepository.updateRoutine(id, routine));
      expect(result, false);
    });
  });
}

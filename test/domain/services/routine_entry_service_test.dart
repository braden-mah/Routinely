import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:routinely/data/repositories/routine_entry_repository.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';
import 'package:routinely/domain/services/routine_entry_service.dart';

import '../fixtures/fixtures.dart';
import 'routine_entry_service_test.mocks.dart';

@GenerateMocks([RoutineEntryRepository])
void main() {
  MockRoutineEntryRepository routineEntryRepository =
      MockRoutineEntryRepository();
  RoutineEntry routineEntry =
      RoutineEntry.noId(1, 'test', DateTime.parse('2015-05-08'), []);
  RoutineEntryService routineEntryService =
      RoutineEntryService(routineEntryRepository);
  group('adding a routine entry', () {
    test('returns true if the routine entry is added successfully', () async {
      when(routineEntryRepository.addRoutineEntry(routineEntry))
          .thenAnswer((_) async => true);
      final result = await routineEntryService.addRoutineEntry(routineEntry);
      verify(routineEntryRepository.addRoutineEntry(routineEntry));
      expect(result, true);
    });
    test('returns false if the routine entry is not added successfully',
        () async {
      when(routineEntryRepository.addRoutineEntry(routineEntry))
          .thenAnswer((_) async => false);
      final result = await routineEntryService.addRoutineEntry(routineEntry);
      verify(routineEntryRepository.addRoutineEntry(routineEntry));
      expect(result, false);
    });
  });
  group('deleting a routine entry', () {
    test('returns true if the routine entry is deleted successfully', () async {
      when(routineEntryRepository.deleteRoutineEntry(1))
          .thenAnswer((_) async => true);
      final result = await routineEntryService.deleteRoutineEntry(1);
      verify(routineEntryRepository.deleteRoutineEntry(1));
      expect(result, true);
    });
    test('return false if the routine entry is not deleted', () async {
      when(routineEntryRepository.deleteRoutineEntry(1))
          .thenAnswer((_) async => false);
      final result = await routineEntryService.deleteRoutineEntry(1);
      verify(routineEntryRepository.deleteRoutineEntry(1));
      expect(result, false);
    });
  });
  group('getting a list of routine entries', () {
    test('returns a list of routine entries', () async {
      when(routineEntryRepository.getAllRoutineEntries(1))
          .thenAnswer((_) async => routineEntriesFixture);
      final result = await routineEntryService.getAllRoutineEntries(1);
      verify(routineEntryRepository.getAllRoutineEntries(1));
      expect(result.length, 3);
    });
  });
  group('updating a routine entry', () {
    test('returns true if updated successfully', () async {
      when(routineEntryRepository.updateRoutineEntry(1, routineEntry))
          .thenAnswer((_) async => true);
      final result =
          await routineEntryService.updateRoutineEntry(1, routineEntry);
      verify(routineEntryRepository.updateRoutineEntry(1, routineEntry));
      expect(result, true);
    });
    test('return false if update fails', () async {
      when(routineEntryRepository.updateRoutineEntry(1, routineEntry))
          .thenAnswer((_) async => false);
      final result =
          await routineEntryService.updateRoutineEntry(1, routineEntry);
      verify(routineEntryRepository.updateRoutineEntry(1, routineEntry));
      expect(result, false);
    });
  });
}

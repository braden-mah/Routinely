// Mocks generated by Mockito 5.0.17 from annotations
// in routinely/test/domain/services/routine_service_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:routinely/data/repositories/routine_repository.dart' as _i2;
import 'package:routinely/domain/entities/routine_entity.dart' as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [RoutineRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRoutineRepository extends _i1.Mock implements _i2.RoutineRepository {
  MockRoutineRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> addRoutine(_i4.Routine? routine) =>
      (super.noSuchMethod(Invocation.method(#addRoutine, [routine]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> updateRoutine(int? id, _i4.Routine? routine) =>
      (super.noSuchMethod(Invocation.method(#updateRoutine, [id, routine]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> deleteRoutine(int? id) =>
      (super.noSuchMethod(Invocation.method(#deleteRoutine, [id]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<List<_i4.Routine>> getAllRoutines() =>
      (super.noSuchMethod(Invocation.method(#getAllRoutines, []),
              returnValue: Future<List<_i4.Routine>>.value(<_i4.Routine>[]))
          as _i3.Future<List<_i4.Routine>>);
}
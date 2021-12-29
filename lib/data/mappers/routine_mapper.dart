import 'package:routinely/domain/entities/routine_entity.dart';

class RoutineMapper {
  static Routine fromMap(Map<String, dynamic> map) =>
      Routine.withId(map['id'], map['name'], map['description']);
  static Map<String, dynamic> toMap(Routine routine) {
    Map<String, dynamic> map = {
      'name': routine.title,
      'description': routine.description,
    };
    if (routine.id != null) {
      map['id'] = routine.id;
    }
    return map;
  }
}

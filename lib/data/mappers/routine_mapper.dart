import 'package:routinely/domain/entities/routine_entity.dart';

class RoutineMapper {
  static Routine fromMap(Map<String, dynamic> map) =>
      Routine.withId(map['id'], map['name'], map['description']);
  static Map<String, dynamic> toMap(Routine routine) => {
        'id': routine.id,
        'name': routine.title,
        'description': routine.description
      };
}

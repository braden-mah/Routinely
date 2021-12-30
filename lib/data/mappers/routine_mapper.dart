import 'package:routinely/domain/entities/routine_entity.dart';

class RoutineMapper {
  static Routine fromMap(Map<String, dynamic> map) {
    String checkboxes = map['checkboxes'];
    return Routine.withId(
        map['id'], map['name'], map['description'], checkboxes.split('\t'));
  }

  static Map<String, dynamic> toMap(Routine routine) {
    Map<String, dynamic> map = {
      'name': routine.title,
      'description': routine.description,
      'checkboxes': routine.checkboxes.join('\t'),
    };
    if (routine.id != null) {
      map['id'] = routine.id;
    }
    return map;
  }
}

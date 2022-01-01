import 'package:routinely/core/util/date_time_util.dart';
import 'package:routinely/domain/entities/routine_entry_entity.dart';

class RoutineEntryMapper {
  static Map<String, dynamic> toMap(RoutineEntry routineEntry) {
    Map<String, dynamic> map = {
      'routineId': routineEntry.routineId,
      'note': routineEntry.note,
      'date': DateTimeUtil.toStringDate(routineEntry.date),
      'checkboxes': routineEntry.checkboxes.join('\t'),
    };
    if (routineEntry.id != null) {
      map['id'] = routineEntry.id;
    }
    return map;
  }

  static RoutineEntry fromMap(Map<String, dynamic> map) {
    return RoutineEntry.withId(
        map['id'],
        map['routineId'],
        map['note'],
        DateTime.parse(map['date']),
        map['checkboxes'] != '' ? map['checkboxes'].split('\t') : []);
  }
}

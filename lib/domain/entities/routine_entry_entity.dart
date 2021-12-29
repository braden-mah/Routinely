class RoutineEntry {
  final int? id;
  final int routineId;
  final String note;
  final DateTime date;
  RoutineEntry.noId(this.routineId, this.note, this.date) : id = null;
  RoutineEntry.withId(this.id, this.routineId, this.note, this.date);
}

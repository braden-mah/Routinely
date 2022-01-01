class RoutineEntry {
  final int? id;
  final int routineId;
  final String note;
  final DateTime date;
  final List<String> checkboxes;
  RoutineEntry.noId(this.routineId, this.note, this.date, this.checkboxes)
      : id = null;
  RoutineEntry.withId(
      this.id, this.routineId, this.note, this.date, this.checkboxes);
}

import 'package:equatable/equatable.dart';

class Routine extends Equatable {
  final int? id;
  final String title;
  final String description;
  final List<String> checkboxes;
  const Routine.noId(this.title, this.description, this.checkboxes) : id = null;
  const Routine.withId(this.id, this.title, this.description, this.checkboxes);

  @override
  List<Object?> get props => [id, title, description];
}

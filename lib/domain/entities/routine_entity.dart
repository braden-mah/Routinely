import 'package:equatable/equatable.dart';

class Routine extends Equatable {
  final int? id;
  final String title;
  final String description;
  const Routine.noId(this.title, this.description) : id = null;
  const Routine.withId(this.id, this.title, this.description);

  @override
  List<Object?> get props => [id, title, description];
}

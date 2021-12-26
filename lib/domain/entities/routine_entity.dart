import 'package:equatable/equatable.dart';

class Routine extends Equatable {
  final String title;
  final String description;
  const Routine(this.title, this.description);

  @override
  List<Object?> get props => [title, description];
}

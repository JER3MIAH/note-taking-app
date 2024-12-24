import 'package:equatable/equatable.dart';

abstract class TagEvent extends Equatable {
  const TagEvent();

  @override
  List<Object> get props => [];
}

class SelectTag extends TagEvent {
  final String tag;

  const SelectTag({
    required this.tag,
  });
  @override
  List<Object> get props => [tag];
}

class ResetSelectedTag extends TagEvent {
  const ResetSelectedTag();
}

class AddTags extends TagEvent {
  final List<String> tags;

  const AddTags({
    required this.tags,
  });
  @override
  List<Object> get props => [tags];
}

class DeleteTags extends TagEvent {
  final List<String> tags;

  const DeleteTags({
    required this.tags,
  });
  @override
  List<Object> get props => [tags];
}

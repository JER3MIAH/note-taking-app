import 'package:equatable/equatable.dart';

class TagState extends Equatable {
  final String? selectedTag;
  final List<String> tags;
  const TagState({
    this.selectedTag,
    this.tags = const [],
  });

  @override
  List<Object> get props => [selectedTag ?? '', tags];

  TagState copyWith({
    String? selectedTag,
    bool resetSelectedTag = false,
    List<String>? tags,
  }) {
    return TagState(
      selectedTag: resetSelectedTag ? null : selectedTag ?? this.selectedTag,
      tags: tags ?? this.tags,
    );
  }
}

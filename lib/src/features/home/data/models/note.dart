import 'dart:convert';

class Note {
  final String id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String title;
  final List<String> tags;
  final String note;
  final bool isArchived;

  Note({
    required this.id,
    required this.createdAt,
    this.updatedAt,
    required this.title,
    required this.tags,
    required this.note,
    this.isArchived = false,
  });

  // Note.empty()
  //     : id = '',
  //       createdAt = DateTime.now(),
  //       updatedAt = null,
  //       title = '',
  //       tags = [],
  //       note = '',
  //       isArchived = false;

  Note copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? title,
    List<String>? tags,
    String? note,
    bool? isArchived,
  }) {
    return Note(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
      tags: tags ?? this.tags,
      note: note ?? this.note,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'title': title,
      'tags': tags,
      'note': note,
      'isArchived': isArchived,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      title: map['title'],
      tags: List<String>.from((map['tags'])),
      note: map['note'],
      isArchived: map['isArchived'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(id: $id,/ncreatedAt: $createdAt,/nupdatedAt: $updatedAt,/ntitle: $title,/ntags: $tags,/nnote: $note,/nisArchived: $isArchived)';
  }
}
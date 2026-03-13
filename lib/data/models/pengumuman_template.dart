import 'package:equatable/equatable.dart';

class PengumumanTemplate extends Equatable {
  final int? id;
  final String title;
  final String content;
  final String? type;
  final DateTime? createdAt;

  const PengumumanTemplate({
    this.id,
    required this.title,
    required this.content,
    this.type,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'type': type,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  factory PengumumanTemplate.fromMap(Map<String, dynamic> map) {
    return PengumumanTemplate(
      id: map['id'] as int?,
      title: map['title'] as String,
      content: map['content'] as String,
      type: map['type'] as String?,
      createdAt: map['created_at'] != null 
          ? DateTime.parse(map['created_at'] as String) 
          : null,
    );
  }

  PengumumanTemplate copyWith({
    int? id,
    String? title,
    String? content,
    String? type,
    DateTime? createdAt,
  }) {
    return PengumumanTemplate(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, title, content, type, createdAt];
}

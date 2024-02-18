import 'package:flutter/material.dart';
import 'package:note_app/utils/utils.dart';
import 'package:uuid/uuid.dart';

class Note {
  Note({
    String? id,
    required this.title,
    required this.content,
    required this.dateCreated,
    required this.dateModified,
  })  : id = id ?? const Uuid().v4(),
        color = Utils.getNoteColor();

  final String id;
  final String title;
  final String content;
  final DateTime dateCreated;
  final DateTime dateModified;
  final Color color;

  factory Note.fromJson(Map<String, dynamic> jsonData) {
    return Note(
      id: jsonData["id"],
      title: jsonData["title"],
      content: jsonData["content"],
      dateCreated: DateTime.parse(jsonData["dateCreated"]),
      dateModified: DateTime.parse(jsonData["dateModified"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      'title': title,
      'content': content,
      'dateCreated': dateCreated.toIso8601String(),
      'dateModified': dateModified.toIso8601String(),
    };
  }

  Note copyWith({
    String? title,
    String? content,
    DateTime? dateModified,
  }) {
    return Note(
        title: title ?? this.title,
        content: content ?? this.content,
        dateCreated: dateCreated,
        dateModified: dateModified ?? this.dateModified);
  }
}

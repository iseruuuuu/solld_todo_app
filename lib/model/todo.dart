import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class Todo {
  final String id;
  final String description;
  final bool done;
  final String contents;

  Todo({
    required this.description,
    this.done = false,
    required this.contents,
  }) : id = DateTime.now().millisecondsSinceEpoch.toString();

  const Todo.withId({
    required this.id,
    required this.description,
    this.done = false,
    required this.contents,
  });

  static const initialTodos = [
    Todo.withId(
      id: '0',
      description: 'サンプル１',
      done: true,
      contents: '',
    ),
    Todo.withId(
      id: '1',
      description: 'サンプル２',
      contents: '',
    ),
  ];

  Todo copyWith({
    String? id,
    String? description,
    bool? done,
    String? contents,
    int? colorCode,
  }) {
    return Todo.withId(
      id: id ?? this.id,
      description: description ?? this.description,
      done: done ?? this.done,
      contents: contents ?? this.contents,
    );
  }

  String toJson() {
    return jsonEncode({
      'id': id,
      'text': description,
      'done': done,
      'contents': contents,
    });
  }

  factory Todo.fromJson(String json) {
    final mapData = jsonDecode(json);
    return Todo.withId(
      id: mapData['id'] as String,
      description: mapData['text'] as String,
      done: mapData['done'] as bool,
      contents: mapData['contents'] as String,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Todo && other.id == id;
  }

  @override
  int get hashCode => Object.hash(
        id.hashCode,
        description.hashCode,
        done.hashCode,
        contents.hashCode,
      );
}

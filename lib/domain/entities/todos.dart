// To parse this JSON data, do
//
//     final toDos = toDosFromJson(jsonString);

import 'dart:convert';

List<ToDos> toDosFromJson(String str) => List<ToDos>.from(json.decode(str).map((x) => ToDos.fromJson(x)));

String toDosToJson(List<ToDos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToDos {
  ToDos({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int? userId;
  int? id;
  String? title;
  bool? completed;

  factory ToDos.fromJson(Map<String, dynamic> json) => ToDos(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
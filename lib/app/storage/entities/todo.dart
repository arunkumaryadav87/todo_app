import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 2)
class ToDo extends HiveObject {
  ToDo({required this.userId, required this.title, required this.id, required this.completed});
  
  @HiveField(0)
  int? userId;

  @HiveField(1)
  String? title;

  @HiveField(2)
  int? id;

  @HiveField(3)
  bool? completed;
}
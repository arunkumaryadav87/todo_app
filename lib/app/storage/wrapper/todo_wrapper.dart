import 'package:todo_app/app/storage/entities/todo.dart';
import 'package:todo_app/domain/entities/todos.dart';

class ToDoWrapper {
  static ToDo transformToDo(ToDos toDos) {
    return ToDo(
      userId: toDos.userId,
      title: toDos.title,
      id: toDos.id,
      completed: toDos.completed,
    );
  }

  static ToDos transformToDos(ToDo todo) {
    return ToDos(
      userId: todo.userId,
      title: todo.title,
      id: todo.id,
      completed: todo.completed,
    );
  }
}
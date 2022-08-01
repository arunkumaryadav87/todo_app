import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/app/services/models/storage_item.dart';
import 'package:todo_app/app/services/secure_storage.dart';
import 'package:todo_app/app/storage/entities/todo.dart';
import 'package:todo_app/app/storage/wrapper/todo_wrapper.dart';
import 'package:todo_app/data/repositories/login_repo_impl.dart';
import 'package:todo_app/domain/entities/todos.dart';
import 'package:todo_app/domain/usecases/todos_use_case.dart';
import 'package:todo_app/presentation/controllers/login/login_binding.dart';
import 'package:todo_app/presentation/pages/login/login_screen.dart';

class ToDosController extends GetxController {
  ToDosController(this._toDosUseCase);

  final ToDosUseCase _toDosUseCase;
  final StorageService _storageService = StorageService();

  var todos = RxList<ToDos>([]);
  List<ToDos> _allToDos = [];

  logout() async {
    // controller destroyed after login successful all previous views replaced
    await _storageService
        .writeSecureData(StorageItem(_storageService.loginKey, "false"));
    Get.lazyPut(() => LoginRepositoriesImpl());
    Get.off(() => LoginScreen(), binding: LoginBindings());
  }

  fetchData() async {
    _refreshItems();

    if (_allToDos.isEmpty) {
      var result = await _toDosUseCase.execute();
      result.fold(
        (error) {
          debugPrint("error code: ${error.statusCode}");
          debugPrint("error message: ${error.errorMessage}");
        },
        (todos) {
          _allToDos.clear();
          _allToDos.addAll(todos);
          for (var todo in _allToDos) {
            _updateItem(todo);
          }
        },
      );
    }

    updateToDoList();
  }

  updateToDoList() {
    todos.clear();
    todos.addAll(_allToDos);
    update();
  }

  Future<void> filter(String enteredKeyword) async {
    List<ToDos> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allToDos;
    } else {
      results = _allToDos
          .where((todo) =>
              todo.title!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    todos.clear();
    todos.addAll(results);
    update();
  }

  // Update a single item
  Future<void> _updateItem(ToDos toDos) async {
    var todoBox = Hive.box('todos_box');
    await todoBox.put(toDos.id, ToDoWrapper.transformToDo(toDos));
  }

  Future<void> updateTaskStatus(ToDos toDos) async {
    var todoBox = Hive.box('todos_box');
    await todoBox.delete(toDos.id);
    await todoBox.put(
      toDos.id,
      ToDoWrapper.transformToDo(
        ToDos(
          userId: toDos.userId,
          title: toDos.title,
          id: toDos.id,
          completed: toDos.completed! ? false : true,
        ),
      ),
    );
    fetchData();
  }

  // Get all items from the database
  void _refreshItems() {
    var todoBox = Hive.box('todos_box');
    List<ToDos> hiveResult = [];
    for (var key in todoBox.keys) {
      ToDo todo = todoBox.get(key);
      hiveResult.add(ToDoWrapper.transformToDos(todo));
    }

    if (hiveResult.isNotEmpty) {
      _allToDos.clear();
      _allToDos.addAll(hiveResult);
    }
  }
}

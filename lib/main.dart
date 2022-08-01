import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/app/storage/entities/todo.dart';
import 'package:todo_app/presentation/app.dart';
import 'package:todo_app/app/get_dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  Hive.registerAdapter(ToDoAdapter());
  await Hive.initFlutter();
  await Hive.openBox('todos_box');
  runApp(const App());
}
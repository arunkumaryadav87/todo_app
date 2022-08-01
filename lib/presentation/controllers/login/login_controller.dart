import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/services/models/storage_item.dart';
import 'package:todo_app/app/services/secure_storage.dart';
import 'package:todo_app/app/widget/common_widgets.dart';
import 'package:todo_app/data/repositories/todos_repo_impl.dart';
import 'package:todo_app/domain/usecases/login_use_case.dart';
import 'package:todo_app/presentation/controllers/todos/todos_binding.dart';
import 'package:todo_app/presentation/pages/todos/todos_screen.dart';

class LoginController extends GetxController {
  LoginController(this._loginUseCase);
  final LoginUseCase _loginUseCase;
  final StorageService _storageService = StorageService();

  String username = "";
  String password = "";

  login() async {
    debugPrint('username: $username');
    debugPrint('password: $password');
    if (username.isNotEmpty && password.isNotEmpty) {
      bool loginSuccess = await _loginUseCase.execute(Tuple2(username, password));
      if (loginSuccess) {
        await _storageService.writeSecureData(StorageItem(_storageService.loginKey, "true"));
        Get.lazyPut(() => ToDosRepositoriesImpl());
        Get.off(() => ToDoListScreen(), binding: ToDosBinding());
      } else {
        CommonWidgets.notify("Incorrect username or password");
      }
    } else {
      CommonWidgets.notify("Username or password cannot be blank");
    }
  }
}
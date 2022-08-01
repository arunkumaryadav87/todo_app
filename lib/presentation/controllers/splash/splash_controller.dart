import 'package:get/get.dart';
import 'package:todo_app/app/services/secure_storage.dart';
import 'package:todo_app/data/repositories/todos_repo_impl.dart';
import 'package:todo_app/presentation/controllers/login/login_binding.dart';
import 'package:todo_app/presentation/controllers/todos/todos_binding.dart';
import 'package:todo_app/presentation/pages/login/login_screen.dart';
import 'package:todo_app/presentation/pages/todos/todos_screen.dart';

class SplashController extends GetxController {
  final StorageService _storageService = StorageService();

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    await _storageService.readAllSecureData().then((storageItems) {
      if (storageItems.isNotEmpty && storageItems.first.value == "true") {
        Get.lazyPut(() => ToDosRepositoriesImpl());
        Get.off(() => ToDoListScreen(), binding: ToDosBinding());
      } else {
        Get.off(() => LoginScreen(), binding: LoginBindings());
      }
    });
  }
}
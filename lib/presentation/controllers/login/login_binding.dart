import 'package:get/get.dart';
import 'package:todo_app/data/repositories/login_repo_impl.dart';
import 'package:todo_app/domain/usecases/login_use_case.dart';
import 'package:todo_app/presentation/controllers/login/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => LoginRepositoriesImpl());
    Get.lazyPut(() => LoginUseCase(Get.find<LoginRepositoriesImpl>()));
    Get.lazyPut(() => LoginController(Get.find()));
  }
}
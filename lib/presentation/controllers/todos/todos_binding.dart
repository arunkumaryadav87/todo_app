import 'package:get/get.dart';
import 'package:todo_app/data/repositories/todos_repo_impl.dart';
import 'package:todo_app/domain/usecases/todos_use_case.dart';
import 'package:todo_app/presentation/controllers/todos/todos_controller.dart';

class ToDosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ToDosUseCase(Get.find<ToDosRepositoriesImpl>()));
    Get.lazyPut(() => ToDosController(Get.find()));
  }
}
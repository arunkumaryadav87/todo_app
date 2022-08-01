import 'package:get/get.dart';
import 'package:todo_app/data/repositories/login_repo_impl.dart';
import 'package:todo_app/data/repositories/todos_repo_impl.dart';
import 'package:todo_app/presentation/controllers/splash/splash_controller.dart';

Future<void> init() async {
  Get.lazyPut(() => ToDosRepositoriesImpl());
  Get.lazyPut(() => LoginRepositoriesImpl());

  Get.lazyPut(() => SplashController());
}

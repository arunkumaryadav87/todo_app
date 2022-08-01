import 'package:get/get.dart';
import 'package:todo_app/presentation/pages/login/login_screen.dart';
import 'package:todo_app/presentation/pages/splash/splash_screen.dart';
import 'package:todo_app/presentation/pages/todos/todos_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String toDoList = '/toDoList';
  // static const String toDoDetail = '/toDoDetail';

  static String getInitialRoute()=> initial;
  static String getSplashRoute() => splash;
  static String getLoginRoute() => login;
  static String getToDoListRoute() => toDoList;
  // static String getToDoDetailRoute() => toDoDetail;

  static List<GetPage> routes = [
    GetPage(name: splash, page: () {
      return const SplashScreen();
    }),
    GetPage(name: login, page: () {
      return LoginScreen();
    }),
    GetPage(name: toDoList, page: () {
      return ToDoListScreen();
    }),
  ];
}
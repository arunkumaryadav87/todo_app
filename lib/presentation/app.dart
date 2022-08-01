import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/pages/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

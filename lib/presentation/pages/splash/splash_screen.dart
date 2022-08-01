import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/config/custom_styles.dart';
import 'package:todo_app/app/config/string_constants.dart';
import 'package:todo_app/app/utils/dimensions.dart';
import 'package:todo_app/presentation/controllers/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.navigateToHome();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Dimensions.splashLogo,
              height: Dimensions.splashLogo,
              color: Colors.blue,
              child: const Icon(
                Icons.receipt_outlined,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: Dimensions.standardMargin,
            ),
            Text(
              StringConstants.todo,
              style: CustomStyles.textStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

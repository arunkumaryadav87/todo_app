import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/config/custom_styles.dart';

class CommonWidgets {
  static notify(String msg) {
    final snackbar = SnackBar(
      content: Text(msg, style: CustomStyles.textStyle,),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(snackbar);
  }

  static AppBar customAppBar({
    required String title,
    String leadingIconText = "",
    bool isExit = false,
  }) {
    return AppBar(
      title: Text(title),

    );
  }
}
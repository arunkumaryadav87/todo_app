import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/config/custom_styles.dart';
import 'package:todo_app/app/utils/dimensions.dart';
import 'package:todo_app/app/config/string_constants.dart';
import 'package:todo_app/presentation/controllers/login/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.standardMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(Dimensions.standardMargin),
                  child: const Icon(
                    Icons.receipt_outlined,
                    size: 64,
                    color: Colors.blue,
                  ),
                ),
                TextField(
                  style: CustomStyles.textStyle,
                  controller: userNameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Dimensions.smallMargin,
                      vertical: Dimensions.smallMargin,
                    ),
                    border: OutlineInputBorder(),
                    labelText: StringConstants.username,
                    labelStyle: CustomStyles.textStyle,
                  ),
                ),
                SizedBox(
                  height: Dimensions.mediumMargin,
                ),
                TextField(
                  style: CustomStyles.textStyle,
                  controller: passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Dimensions.smallMargin,
                      vertical: Dimensions.smallMargin,
                    ),
                    border: OutlineInputBorder(),
                    labelText: StringConstants.password,
                    labelStyle: CustomStyles.textStyle,
                  ),
                ),
                SizedBox(
                  height: Dimensions.mediumMargin,
                ),
                ElevatedButton(
                  onPressed: () async {
                    controller.username = userNameController.text;
                    controller.password = passwordController.text;
                    return controller.login();
                  },
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(Dimensions.standardMargin),
                      child: Text(
                        StringConstants.login,
                        style: CustomStyles.textStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

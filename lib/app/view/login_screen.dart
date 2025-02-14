import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:to_do_machine_task/app/controller/theme_controller.dart';
import 'package:to_do_machine_task/app/view/forget_password_screen.dart';
import 'package:to_do_machine_task/app/view/register_screen.dart';
import 'package:to_do_machine_task/app/widgets/app_button.dart';
import 'package:to_do_machine_task/app/widgets/app_text_field.dart';
import 'package:to_do_machine_task/core/style/app_text_style.dart';
import 'package:to_do_machine_task/core/style/colors.dart';

import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final LoginController loginController = Get.put(LoginController());

    final formKey = GlobalKey<FormState>();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          themeController.isDarkMode.value ? Brightness.light : Brightness.dark,
    ));

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Obx(() => Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: themeController.isDarkMode.value,
                        onChanged: (value) {
                          themeController.toggleTheme();
                        },
                      ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Text(
                    "mimo",
                    style: AppTextStyle.appTextStyle_14_800.copyWith(
                        fontSize: 75,
                        fontStyle: FontStyle.italic,
                        color: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
                AppTextField(
                  label: "Email",
                  controller: emailController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Enter Email';
                    }
                  },
                ),
                SizedBox(height: 20),
                AppTextField(
                  label: "Password",
                  controller: passController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Enter Password';
                    }
                  },
                ),
                SizedBox(height: 13),
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => ForgetPasswordScreen());
                    },
                    child: Text("Forget Password?",
                        style: AppTextStyle.appTextStyle_14_800.copyWith(
                            fontSize: 12,
                            color: themeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black)),
                  ),
                ),
                SizedBox(height: 30),
                AppButton(
                    text: "CONTINUE",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        loginController.login(
                            emailController.text, passController.text);
                      }
                    }),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    InkWell(
                      onTap: () {
                        Get.to(() => RegisterScreen());
                      },
                      child: Text(
                        " Register",
                        style: AppTextStyle.appTextStyle_14_800UnderLined
                            .copyWith(
                                color: themeController.isDarkMode.value
                                    ? whiteClr
                                    : blackClr),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

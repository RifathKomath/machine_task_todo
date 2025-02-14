import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_machine_task/app/controller/theme_controller.dart';
import 'package:to_do_machine_task/app/widgets/app_button.dart';
import 'package:to_do_machine_task/app/widgets/app_text_field.dart';
import 'package:to_do_machine_task/core/style/app_text_style.dart';
import 'package:to_do_machine_task/core/style/colors.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final ThemeController themeController = Get.put(ThemeController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeController.isDarkMode.value ? blackClr : whiteClr,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(105),
          child: Row(
            children: [
             GestureDetector(
               onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.arrow_back,
                    size: 22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Text(
                  "Forgot Password",
                  style: AppTextStyle.appTextStyle_14_800.copyWith(
                    fontSize: 22,
                    color:
                        themeController.isDarkMode.value ? whiteClr : blackClr,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            AppTextField(label: "Email", controller: emailController),
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter the email address you used to create your account and  we will email you a link to reset your passoword.",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 13,
            ),
            SizedBox(
              height: 30,
            ),
            AppButton(text: "CONTINUE", onPressed: () {}),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                InkWell(
                    child: Text(
                  " Log In",
                  style: AppTextStyle.appTextStyle_14_800UnderLined.copyWith(
                     color:
                        themeController.isDarkMode.value ? whiteClr : blackClr,
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

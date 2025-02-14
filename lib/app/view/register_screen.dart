import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_machine_task/app/widgets/app_button.dart';
import '../../core/style/app_text_style.dart';
import '../../core/style/colors.dart';
import '../controller/auth_controller.dart';
import '../controller/theme_controller.dart';
import '../widgets/app_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final themeController = Get.find<ThemeController>();
  final formKey = GlobalKey<FormState>();

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeController.isDarkMode.value ? blackClr : whiteClr,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(105),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.arrow_back, size: 22),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text(
                  "Create an Account",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                AppTextField(
                  label: "Full Name",
                  controller: nameController,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter Full Name' : null,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  label: "Email",
                  controller: emailController,
                  validator: (value) => value!.isEmpty ? 'Enter Email' : null,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  label: "Password",
                  controller: passController,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter Password' : null,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  label: "Confirm Password",
                  controller: confirmPassController,
                  validator: (value) =>
                      value!.isEmpty ? 'Confirm the password' : null,
                ),
                const SizedBox(height: 30),
                AppButton(
                  text: "CONTINUE",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      authController.registerUser(
                        name: nameController.text,
                        email: emailController.text,
                        password: passController.text,
                        confirmPassword: confirmPassController.text,
                      );
                    }
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    InkWell(
                      child: Text(
                        " Log In",
                        style: AppTextStyle.appTextStyle_14_800UnderLined
                            .copyWith(
                                color: themeController.isDarkMode.value
                                    ? whiteClr
                                    : blackClr),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

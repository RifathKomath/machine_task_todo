import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_machine_task/app/controller/auth_controller.dart';
import 'package:to_do_machine_task/app/controller/theme_controller.dart';
import 'package:to_do_machine_task/app/view/login_screen.dart';
import 'package:to_do_machine_task/core/style/colors.dart';
import 'package:to_do_machine_task/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(() => GetMaterialApp(
          title: 'To-Do',
          debugShowCheckedModeBanner: false,
          themeMode: themeController.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: whiteClr,
            primaryColor: blackClr,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: blackClr,
            primaryColor: whiteClr,
          ),
          home: LoginScreen(),
        ));
  }
}

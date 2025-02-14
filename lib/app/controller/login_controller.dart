import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:to_do_machine_task/app/view/category_screen.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxBool isLoading = false.obs;

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please enter email and password");
      return;
    }
    
    try {
      isLoading.value = true;
      UserCredential userData = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      if (userData.user != null) {
        Get.offAll(() => CategoryScreen());
      }
    } catch (e) {
      log("Login Error: $e");
      Get.snackbar("Login Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

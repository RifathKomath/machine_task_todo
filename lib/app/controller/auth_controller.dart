import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:to_do_machine_task/app/model/user_model.dart';
import '../view/category_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
  }


  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      UserModel newUser = UserModel(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: name.trim(),
        createdAt: DateTime.now(),
        status: 1,
      );

      await _firestore.collection('users').doc(newUser.uid).set(newUser.toMap());

      Get.offAll(() => CategoryScreen());
    } catch (e) {
      log("Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itcc_mobile/model/user_model.dart';
import 'package:itcc_mobile/repository/user_repository/autentication.dart';
import 'package:itcc_mobile/repository/user_repository/user_repository.dart';
import 'package:itcc_mobile/screen/home_screen.dart';
import 'package:itcc_mobile/screen/register_upload_profil.dart';

class signUpController extends GetxController {
  static signUpController get instance => Get.find();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();
  final TextEditingController angkatanController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final userRepo = Get.put(UserRepositroy());
  final AutenticationRepository _authService = AutenticationRepository();

  Future<void> pushData(UserModel user) async {
    await userRepo.CreateUser(user);
  }

  Future<void> registerUser(String Email, String Password) async {
    await AutenticationRepository.instance
        .createUserwithEmail(emailController.text, passwordController.text);
    Get.to(homeScreen());
  }

  Future<void> loginUser(String Email, String Password) async {
    await AutenticationRepository.instance
        .loginUserwithEmail(emailController.text, passwordController.text);
    Get.to(homeScreen());
  }
  Future<void> loginGmail()async{
    User? user = await _authService.signInWithGoogle();
    if (user != null) {
      GoogleUserModel gmodel =
      GoogleUserModel.fromFirebaseUser(user);
      registerUser(gmodel.email, "123");
      Get.to(()=>homeScreen());
    } else {
      // Handle unsuccessful login.
    }
  }
}

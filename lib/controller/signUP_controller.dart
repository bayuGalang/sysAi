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

  Future<void> pushData(UserModel user) async {
    await userRepo.CreateUser(user);
  }

  Future<void> registerUser(String Email, String Password) async {
    await AutenticationRepository.instance
        .createUserwithEmail(emailController.text, passwordController.text);
  }

  Future<void> loginUser(String Email, String Password) async {
    await AutenticationRepository.instance
        .loginUserwithEmail(emailController.text, passwordController.text);
    Get.offAll(homeScreen());
  }

}

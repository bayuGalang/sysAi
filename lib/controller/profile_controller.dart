import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itcc_mobile/repository/user_repository/autentication.dart';
import 'package:itcc_mobile/repository/user_repository/user_repository.dart';
import 'package:itcc_mobile/screen/home_screen.dart';

class profileController extends GetxController{
  static profileController get instance => Get.find();

  final _authRepo = Get.put(AutenticationRepository());
  final _userRepo = Get.put(UserRepositroy());
  getUserdata(){
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _userRepo.getUserDataDetails(email);
    } else{
      Get.to(()=>homeScreen());
    }
  }
}
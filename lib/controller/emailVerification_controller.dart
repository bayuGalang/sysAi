import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itcc_mobile/repository/user_repository/autentication.dart';

class mailVerificationController extends GetxController{

  @override
  void onInit() {
    super.onInit();
  }
  Future<void> sendVerificationEmail() async {
    try{
      await AutenticationRepository.instance.sendEmailverification();
    }
    catch(e){

    }
  }
}
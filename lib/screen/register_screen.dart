import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:itcc_mobile/controller/emailVerification_controller.dart';
import 'package:itcc_mobile/repository/user_repository/autentication.dart';
import 'package:itcc_mobile/controller/signUP_controller.dart';
import 'package:email_otp/email_otp.dart';
import 'package:itcc_mobile/helper/validator.dart';
import 'package:itcc_mobile/screen/otpValidator_screen.dart';
import 'package:itcc_mobile/shared/thame.dart';
import 'package:itcc_mobile/widget/custom_widget.dart';

import '../model/user_model.dart';

class getStarted extends StatefulWidget {
  getStarted({Key? key}) : super(key: key);

  @override
  State<getStarted> createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final regis = Get.put(signUpController());
  final drop = Get.put(dropDown());
  final mailver = Get.put(mailVerificationController());
  EmailOTP myAuth = EmailOTP();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(signUpController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          iconview(),
          const SizedBox(
            height: 50,
          ),
          titleView(
              TextTitle: "Get Started in Minutes\nCreate Your Account Now"),
          Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  inputText(controller.nameController, "Nama Lengkap", false,
                      validateName),
                  const SizedBox(height: 16),
                  inputText(
                      controller.nimController, "Nim", false, validateNim),
                  const SizedBox(height: 16),
                  inputText(controller.angkatanController, "Angkatan", false,
                      validateAngkatan),
                  const SizedBox(height: 16),
                  inputText(controller.emailController, "Email", false,
                      validateEmail),
                  const SizedBox(height: 16),
                  inputText(controller.nomorController, "Nomor Telepon", false,
                      validatePhone),
                  const SizedBox(height: 16),
                  inputText(controller.passwordController, "Password", true,
                      validatePassword),
                  const SizedBox(height: 16),
                  dropDown(),
                  const SizedBox(height: 30),
                  customFilledButton(
                      title: "Continue",
                      onPress: () async {
                        final user = UserModel(
                            Nama: controller.nameController.text.trim(),
                            Nim: controller.nimController.text.trim(),
                            Email: controller.emailController.text.trim(),
                            Nomor: controller.nomorController.text.trim(),
                            Jurusan: controller.jurusanController.text.trim(),
                            Password: controller.passwordController.text.trim(),
                            Angkatan:
                                controller.angkatanController.text.trim());
                        if (_formKey.currentState!.validate()) {
                          signUpController.instance.registerUser(
                              controller.emailController.text,
                              controller.passwordController.text);
                          signUpController.instance.pushData(user);
                          await myAuth.setConfig(
                              appEmail: "noreplay@itcc.ac.id",
                              appName: "SysAi - ITCC",
                              userEmail: controller.emailController.text,
                              otpLength: 4,
                              otpType: OTPType.digitsOnly);
                          await mailver.sendVerificationEmail();
                          await myAuth.sendOTP();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("OTP Sudah Dikirim")));
                          Get.offAll(OtpScreen(myauth: myAuth));
                        }
                      })
                ],
              ),
            ),
          ),
          customTextButton(
              title: "Sign In",
              onPress: () {
                Navigator.pushNamed(context, "signInOption");
              })
        ],
      ),
    );
  }
}

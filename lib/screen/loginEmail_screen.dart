import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/signUP_controller.dart';
import '../helper/validator.dart';
import '../shared/thame.dart';
import '../widget/custom_widget.dart';

class loginEmail extends StatelessWidget {
  const loginEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(signUpController());
    final _formKey = GlobalKey<FormState>();
    return ListView(
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
                inputText(controller.emailController, "Email", false, validateEmail),
                const SizedBox(height: 16),
                inputText(controller.nomorController, "Nomor Telepon", false, validatePhone),
                const SizedBox(height: 16),
                inputText(controller.passwordController, "Password", true, validatePassword),
                const SizedBox(height: 16),
                dropDown(),
                const SizedBox(height: 30),
                customFilledButton(
                    title: "Continue",
                    onPress: () {})
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
    );
  }
}

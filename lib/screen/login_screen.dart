import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itcc_mobile/helper/validator.dart';
import 'package:itcc_mobile/screen/register_screen.dart';
import 'package:itcc_mobile/controller/signUP_controller.dart';
import 'package:itcc_mobile/shared/thame.dart';
import 'package:itcc_mobile/widget/custom_widget.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);
  @override
  State<loginScreen> createState() => _loginScreenState();
}
class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(signUpController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          iconview(),
          const SizedBox(
            height: 50,
          ),
          titleView(
              TextTitle: "Login to Your Account\nwith Your Email Address"),
          Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email Adress",
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: validateEmail,
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: validatePassword,
                      obscureText: true,
                      controller: controller.passwordController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot Password",
                      style: blueTextStyle.copyWith(fontWeight: light),
                    )),
                const SizedBox(
                  height: 30,
                ),
                customFilledButton(
                    title: "Sign In",
                    onPress: () {
                      signUpController.instance.loginUser(
                          controller.emailController.text.trim(),
                          controller.passwordController.text.trim());
                    })
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          customTextButton(
              title: "Create New Account",
              onPress: () {
                Navigator.pushNamed(context, "signUp");
              })
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:itcc_mobile/controller/signUP_controller.dart';
import 'package:itcc_mobile/model/user_model.dart';
import 'package:itcc_mobile/repository/user_repository/autentication.dart';
import 'package:itcc_mobile/screen/home_screen.dart';
import 'package:itcc_mobile/shared/thame.dart';
import 'package:itcc_mobile/widget/custom_widget.dart';

class SignInOptionn extends StatelessWidget {
  const SignInOptionn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(signUpController());
    final AutenticationRepository _authService = AutenticationRepository();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 90,
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icon/itcc_logo.png"),
                        fit: BoxFit.fill)),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "Welcome Back! Please Sign In to Continue.",
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: semiBold),
                ),
              ),
              Container(
                height: 250,
                width: 350,
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    customIconFilledButton(
                        title: "Login Dengan Google",
                        icon: "assets/icon/New-Google-Logo.jpg",
                        onPress: () async{
                          User? user = await _authService.signInWithGoogle();
                          if (user != null) {
                            GoogleUserModel gmodel = GoogleUserModel.fromFirebaseUser(user);
                            final userData = UserModel(
                                Nim: "Silahkan Lengkapi Data",
                                Nama: gmodel.displayName,
                                Email: gmodel.email,
                                Jurusan: "Data",
                                Password: "123",
                                Nomor: "Data",
                                Angkatan: "Silahkan Lengkapi Data");
                            controller.registerUser(gmodel.email, "123");
                            controller.loginUser(gmodel.email, "123");
                            controller.pushData(userData);
                          } else {
                            // Handle unsuccessful login.
                          }
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    customIconFilledButton(
                        title: "Login Dengan Microsoft",
                        icon: "assets/icon/Microsoft_logo.svg.png",
                        onPress: () {}),
                    SizedBox(
                      height: 15,
                    ),
                    customIconFilledButton(
                        title: "Login Dengan Email",
                        icon: "assets/images/email.png",
                        onPress: () {
                          Navigator.pushNamed(context, 'signIn');
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    SignOut(
                        title: "Create New Account",
                        onPress: () {
                          Navigator.pushNamed(context, 'signUp');
                        })
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

class SignOut extends StatelessWidget {
  final String title;
  final double width;
  final double heigth;
  final VoidCallback onPress;
  const SignOut(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      this.heigth = 46,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heigth,
      child: TextButton(
          onPressed: onPress,
          child: Text(
            title,
            style: greyTextStyle.copyWith(fontSize: 13, fontWeight: light),
          )),
    );
  }
}

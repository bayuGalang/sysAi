import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:itcc_mobile/firebase_options.dart';
import 'package:itcc_mobile/repository/user_repository/autentication.dart';
import 'package:itcc_mobile/screen/aboutUs_screen.dart';
import 'package:itcc_mobile/screen/editProfil.dart';
import 'package:itcc_mobile/screen/login_screen.dart';
import 'package:itcc_mobile/screen/mySertifikat_screen.dart';
import 'package:itcc_mobile/screen/news_screen.dart';
import 'package:itcc_mobile/screen/onboarding.dart';
import 'package:itcc_mobile/screen/otpValidator_screen.dart';
import 'package:itcc_mobile/screen/profile_screen.dart';
import 'package:itcc_mobile/screen/register_screen.dart';
import 'package:itcc_mobile/screen/signIn_option_screen.dart';
import 'package:itcc_mobile/screen/signUP_succes.dart';
import 'package:itcc_mobile/screen/splash_screen.dart';
import 'package:itcc_mobile/screen/register_upload_profil.dart';
import 'package:itcc_mobile/screen/upload_ktp.dart';
import 'package:itcc_mobile/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const splash_screen(),
        // '/': (context) => const editProfil(),
        'onboarding': (context) => const onboarding_screen(),
        'signIn': (context) => loginScreen(),
        'signInOption': (context) => SignInOption(),
        'signUp': (context) => getStarted(),
        'signUp_profil': (context) => registerUploadProfil(),
        'uploadKTP': (context) => uploadKTP(),
        'signUpSucces': (context) => signUpSucces(),
        'home': (context) => homeScreen(),
        'sertifikat': (context) => sertifikatSaya(),
        // 'news': (context) => MyWebView(),
      },
    );
  }
}

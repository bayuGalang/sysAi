import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:itcc_mobile/shared/thame.dart';
import '../firebase_options.dart';
import '../repository/user_repository/autentication.dart';

class splash_screen extends StatefulWidget {

  const splash_screen({Key? key}) : super(key: key);
  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, 'onboarding', (route) => false);
      WidgetsFlutterBinding.ensureInitialized();
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
          .then((value) => Get.put(AutenticationRepository()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Image.asset(
          "assets/icon/itcc_logo.png",
          width: 305,
          height: 250,
        ),
      ),
    );
  }
}

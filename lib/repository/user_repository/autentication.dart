import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itcc_mobile/screen/home_screen.dart';
import 'package:itcc_mobile/screen/signIn_option_screen.dart';
import '../../screen/onboarding.dart';

class AutenticationRepository extends GetxController {
  static AutenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => onboarding_screen())
        : Get.offAll(() => homeScreen());
  }

  Future<void> createUserwithEmail(String Email, String Password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: Email, password: Password);
    } on FirebaseAuthException catch (e) {
      e.code;
    } catch (_) {}
  }

  Future<void> loginUserwithEmail(String Email, String Password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: Email, password: Password);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure(e.code);
      print('Firebase Auth Exeption - ${ex.message}');
      throw ex;
    } catch (_) {}
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAll(SignInOption());
  }

  Future<void> sendEmailverification() async {
    try{
      await _auth.currentUser?.sendEmailVerification();
    }
    catch(e){}
  }
}

class SignUpWithEmailAndPasswordFailure {
  final String message;
  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occurred."]);
  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a stronger password. ');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'An account already exists for that email.');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support. ');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help. ');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}

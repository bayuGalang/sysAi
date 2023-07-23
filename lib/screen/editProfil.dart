import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itcc_mobile/controller/signUP_controller.dart';
import 'package:itcc_mobile/helper/validator.dart';
import 'package:itcc_mobile/model/user_model.dart';
import 'package:itcc_mobile/screen/profile_screen.dart';
import 'package:itcc_mobile/shared/thame.dart';
import 'package:itcc_mobile/widget/custom_widget.dart';

class editProfil extends StatelessWidget {
  const editProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(signUpController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Edit Profil',
            style: TextStyle(color: blackColor),
          ),
          leading: BackButton(
            color: blackColor,
            onPressed: () => Get.to(() => profileScreen()),
          ),
          backgroundColor: backgroundColor,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
              width: 350,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 10),
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/image.png')),
                    ),
                  ),
                  Text(
                    'Edit Foto',
                    style:
                        greyTextStyle.copyWith(fontWeight: bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          inputText(controller.nameController, "Nama Lengkap",
                              false, validateName),
                          const SizedBox(height: 16),
                          inputText(controller.nimController, "Nim", false,
                              validateNim),
                          const SizedBox(height: 16),
                          inputText(controller.angkatanController, "Angkatan",
                              false, validateAngkatan),
                          const SizedBox(height: 16),
                          inputText(controller.emailController, "Email", false,
                              validateEmail),
                          const SizedBox(height: 16),
                          inputText(controller.nomorController, "Nomor Telepon",
                              false, validatePhone),
                          const SizedBox(height: 16),
                          inputText(controller.passwordController, "Password",
                              true, validatePassword),
                          const SizedBox(height: 16),
                          dropDown(),
                          const SizedBox(height: 30),
                          customFilledButton(
                              title: "Update",
                              onPress: () async {
                                final data = UserModel(
                                    Nim: controller.nimController.text,
                                    Nama: controller.nameController.text,
                                    Email: controller.emailController.text,
                                    Jurusan: controller.jurusanController.text,
                                    Password:
                                        controller.passwordController.text,
                                    Nomor: controller.nomorController.text,
                                    Angkatan:
                                        controller.angkatanController.text);
                                controller.updateUser(data);
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget input(var _TextController, String inputTitle, bool obsecure,
      var validator, var initialValue) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inputTitle,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            initialValue: initialValue,
            controller: _TextController,
            obscureText: obsecure,
            validator: validator,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ],
      ),
    );
  }
}

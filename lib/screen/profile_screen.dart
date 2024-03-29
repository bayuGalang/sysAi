import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:itcc_mobile/screen/aboutUs_screen.dart';
import 'package:itcc_mobile/screen/editProfil.dart';
import 'package:itcc_mobile/screen/home_screen.dart';
import 'package:itcc_mobile/screen/signIn_option_screen.dart';
import '../controller/profile_controller.dart';
import '../model/user_model.dart';
import '../repository/user_repository/autentication.dart';
import '../shared/thame.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(profileController());
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
        ),
        elevation: 0,
        leading: BackButton(
          onPressed: () => Get.to(homeScreen()),
          color: blackColor,
        ),
        backgroundColor: backgroundColor,
      ),
      body: FutureBuilder(
        future: controller.getUserdata(),
        builder: (context, snapshot) {
          UserModel userData = snapshot.data as UserModel;
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 450,
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
                      userData.Nama,
                      style: blackTextStyle.copyWith(
                          fontWeight: bold, fontSize: 20),
                    ),
                    Text(
                      userData.Nim,
                      style: greyTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    iconProfil('assets/icon/edit_profil_icon.png',
                        "Edit Profil", () => Get.to(() => editProfil())),
                    iconProfil(
                        'assets/icon/pin_icon.png', 'Lupa Password', () {}),
                    iconProfil('assets/icon/info.png', 'Tentang',
                        () => Get.to(aboutUsScreen())),
                    iconProfil('assets/icon/fi_log-out.png', 'Logout', () {
                      AutenticationRepository.instance.logout();
                      Get.offAll(() => SignInOptionn());
                    }),
                    Text(
                      'SysAi - ITCC',
                      style: greyTextStyle.copyWith(
                          fontWeight: light, fontSize: 10),
                    )
                  ],
                ),
              ),
            ],
          ));
        },
      ),
    );
  }

  Widget iconProfil(var image, String title, var onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(image),
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}

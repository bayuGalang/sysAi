import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itcc_mobile/screen/profile_screen.dart';
import 'package:itcc_mobile/shared/thame.dart';

class aboutUsScreen extends StatelessWidget {
  const aboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
        ),
        elevation: 0,
        leading: BackButton(
          onPressed: () => Get.off(() => profileScreen()),
          color: blackColor,
        ),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon/itcc_logo.png",
              width: 305,
              height: 100,
            ),
            Text(
              'SysAi - ITCC',
              style: GoogleFonts.montserrat(fontWeight: bold, fontSize: 15),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 300,
              child: Text(
                  'Information Technology Certification Center (ITCC) merupakan unit yang dimiliki oleh Institut Teknologi PLN Jakarta yang telah mendapatkan hak otorisasi dari Certiport Inc sebagai Certiport Authorized Testing Center (CATC) untuk menyelenggarakan pelatihan dan sertifikasi Internasional',
                  textAlign: TextAlign.justify),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 10),
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/pak-jat.png')),
                        ),
                      ),
                      Text("Hendra Jatnika", style: blackTextStyle.copyWith(fontSize: 13, fontWeight: bold)),
                      Text("Koordinator ITCC", style: greyTextStyle.copyWith(fontSize: 10, fontWeight: semiBold),)
                    ],
                  ),
                  SizedBox(width: 30,),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 10),
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/lilies.jpeg')),
                        ),
                      ),
                      Text("Lilies Cahyanti", style: blackTextStyle.copyWith(fontSize: 13, fontWeight: bold),),
                      Text("Koordinator ITCC", style: greyTextStyle.copyWith(fontSize: 10, fontWeight: semiBold),)
                    ],
                  ),
                ],
              ),
            ),
           // Image(image: AssetImage('assets/images/si.jpeg'), width: 330, height: 225,)
          ],
        ),
      ),
    );
  }
}

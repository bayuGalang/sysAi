import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:itcc_mobile/controller/sertif_controller.dart';
import 'package:itcc_mobile/model/sertif_model.dart';
import 'package:itcc_mobile/shared/thame.dart';

import '../controller/profile_controller.dart';

class sertifikatSaya extends StatelessWidget {
  const sertifikatSaya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sertif = Get.put(sertifController());
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Certifacte",
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: backgroundColor,
      ),
      body: FutureBuilder(
          future: sertif.getKegiatan(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                sertifModel cert = snapshot.data as sertifModel;
                var test = cert.valid;
                return Container(
                  margin: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (test == "Lulus") ...[
                          sertifikat(cert.valid, cert.kode),
                        ] else ...[
                          Text("Belum Mengikuti Kegiatan")
                        ]
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Text("Belum Mengikuti Kegiatan"),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Text("Something went wrong"),
                );
              }
            } else {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            return SizedBox();
          }),
    );
  }
}

Widget sertifikat(String kelulusan, String code) {
  if (kelulusan == 'Lulus') {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: whiteColor),
      child: Column(
        children: [
          Image(
            image: AssetImage("assets/icon/mos_badge.png"),
            height: 100,
            width: 100,
          ),
          Text(
            "Congratulation",
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Has Successfully Passed Microsoft Office Exam',
            style: greyTextStyle.copyWith(fontSize: 13, fontWeight: bold),
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Code : ',
                style: blackTextStyle.copyWith(fontWeight: bold),
              ),
              Text(code),
              SizedBox(
                width: 40,
              ),
              Text(
                "Verified By ITCC : ",
                style: blackTextStyle.copyWith(fontSize: 15, fontWeight: bold),
              ),
              Container(
                decoration: BoxDecoration(
                  color: blueColor,
                ),
                child: Text(
                  kelulusan,
                  style:
                      whiteTextStyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  } else {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: whiteColor),
      child: Column(
        children: [
          Text(
            "Congratulation",
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Has Successfully Passed Microsoft Office Exam',
            style: greyTextStyle.copyWith(fontSize: 13, fontWeight: bold),
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Code : ',
                style: blackTextStyle.copyWith(fontWeight: bold),
              ),
              Text(code),
              SizedBox(
                width: 40,
              ),
              Text(
                "Verified By ITCC : ",
                style: blackTextStyle.copyWith(fontSize: 15, fontWeight: bold),
              ),
              Container(
                decoration: BoxDecoration(
                  color: blueColor,
                ),
                child: Text(
                  kelulusan,
                  style:
                      whiteTextStyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}

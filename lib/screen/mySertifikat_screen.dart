import 'package:flutter/material.dart';
import 'package:itcc_mobile/shared/thame.dart';

class sertifikatSaya extends StatelessWidget {
  const sertifikatSaya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Certifacte", style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),),
        elevation: 0,
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: backgroundColor,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              sertifikat('Lulus', 'ind2312'),
              sertifikat('Lulus','91hwidi'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget sertifikat(String kelulusan, String code) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: whiteColor),
    child: Column(
      children: [
       Image(image: AssetImage("assets/icon/mos_badge.png"), height: 100, width: 100,),
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
        SizedBox(height: 14,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Code : ', style: blackTextStyle.copyWith(fontWeight: bold),),
            Text(code),
            SizedBox(width: 40,),
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
                style: whiteTextStyle.copyWith(fontSize: 15, fontWeight: bold),
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

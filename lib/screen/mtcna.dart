import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:itcc_mobile/screen/home_screen.dart';
import 'package:itcc_mobile/shared/thame.dart';

import '../controller/kegiatan_controller.dart';

class mtcnaScreen extends StatefulWidget {
  const mtcnaScreen({Key? key}) : super(key: key);

  @override
  State<mtcnaScreen> createState() => _mtcnaScreenState();
}

class _mtcnaScreenState extends State<mtcnaScreen> {
  @override
  Widget build(BuildContext context) {
    final kegiatan = Get.put(kegiatanController());
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("MTCNA", style:blackTextStyle.copyWith(fontWeight: bold),),
        backgroundColor: backgroundColor,
        leading: IconButton(onPressed: (){Get.to(homeScreen());}, icon: Icon(Icons.arrow_back,color: blackColor,),),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(50),
            width: double.maxFinite,
            child: Image.asset("assets/icon/Mikrotik-2.png", width: 150, height: 150,),
          ),
          Text("MikroTik Certified Network Associate\n(MTCNA)", style: blackTextStyle.copyWith(fontWeight: bold),textAlign: TextAlign.center,),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 30),
            width: 250,
            child: Text("MikroTik Certified Network Associate (MTCNA) adalah sebuah program sertifikasi dalam dunia IT yang diperuntukkan bagi seorang teknisi (Network Engineer) yang dirancang untuk mengukur pemahaman mengenai dasar-dasar networking dan dapat meningkatkan atau memberi nilai tambah pada Network Engineer tersebut", textAlign: TextAlign.justify,),
          ),
          Container(
            width: 250,
            child:  Row(
              children: [
                Text("Waktu Kegiatan  : "),
                Text("29 Agustus 2023", style: blueTextStyle.copyWith(fontWeight: bold),)
              ],
            ),
          ),
          Container(
            width: 250,
            child:  Row(
              children: [
                Text("Harga Kegiatan  : "),
                Text("Rp. 1.000.000", style: blueTextStyle.copyWith(fontWeight: bold),)
              ],
            ),
          ),

        ],
      ),
    );
  }
}

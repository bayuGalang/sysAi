import 'package:flutter/material.dart';
import 'package:itcc_mobile/controller/kegiatan_controller.dart';
import 'package:itcc_mobile/model/kegiatan_model.dart';
import 'package:itcc_mobile/shared/thame.dart';
import '../widget/custom_widget.dart';

class listKegiatanScreen extends StatefulWidget {
  const listKegiatanScreen({Key? key}) : super(key: key);

  @override
  State<listKegiatanScreen> createState() => _listKegiatanScreenState();
}

class _listKegiatanScreenState extends State<listKegiatanScreen> {
  @override
  Widget build(BuildContext context) {
    final kegiatan = kegiatanController();
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Daftar Kegiatan",
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
          ),
          elevation: 0,
          iconTheme: IconThemeData(color: blackColor),
          backgroundColor: backgroundColor,
        ),
        body: FutureBuilder(
          future: kegiatan.mos(),
          builder: (context, snapshot) {
            return transactionItem('assets/icon/MOS-Badge.png', 'MOS',
                "kegiatan.Nama_kegiatan", "750.000", "19 Aug", () {});
          },
        ));
  }
}

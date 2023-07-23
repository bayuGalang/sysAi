import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:itcc_mobile/screen/home_screen.dart';
import 'package:itcc_mobile/shared/thame.dart';
import 'package:itcc_mobile/widget/custom_widget.dart';

import '../controller/kegiatan_controller.dart';

class mosScreen extends StatefulWidget {
  const mosScreen({Key? key}) : super(key: key);

  @override
  State<mosScreen> createState() => _mosScreenState();
}

class _mosScreenState extends State<mosScreen> {
  @override
  Widget build(BuildContext context) {
    final kegiatan = Get.put(kegiatanController());
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "MTCNA",
          style: blackTextStyle.copyWith(fontWeight: bold),
        ),
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {
            Get.to(homeScreen());
          },
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(50),
            width: double.maxFinite,
            child: Image.asset(
              "assets/icon/MOS-Badge.png",
              width: 150,
              height: 150,
            ),
          ),
          Text(
            "MikroTik Certified Network Associate\n(MTCNA)",
            style: blackTextStyle.copyWith(fontWeight: bold),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 30),
            width: 250,
            child: Text(
              "Microsoft Office Specialist adalah sertifikasi untuk memberikan penilaian keterampilan dan pengetahuan terhadap dunia IT yang dimana semakin terus menerus berkembang dengan memberikan siswa dan profesional latihan untuk menilai pemahaman mereka tentang penggunaan aplikasi Microsoft Office.",
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            width: 250,
            child: Row(
              children: [
                Text("Waktu Kegiatan  : "),
                Text(
                  "29 Agustus 2023",
                  style: blueTextStyle.copyWith(fontWeight: bold),
                )
              ],
            ),
          ),
          Container(
            width: 250,
            child: Row(
              children: [
                Text("Harga Kegiatan  : "),
                Text(
                  "Rp. 1.000.000",
                  style: blueTextStyle.copyWith(fontWeight: bold),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 35, left: 100, right: 100),
            child: customFilledButton(
                title: "Daftar",
                onPress: () {
                  PopUpx(context);
                }),
          )
        ],
      ),
    );
  }
}

PopUpx(BuildContext context) {
  Widget level() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: whiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Nilai Pretest Terakhir',
                style:
                    blackTextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
              ),
              const Spacer(),
              Text(
                '70 Benar',
                style:
                    greenTextStyle.copyWith(fontWeight: semiBold, fontSize: 10),
              ),
              Text(
                ' Dari ' + '100 Soal',
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 10),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 0.7,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: backgroundColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget popUpHeader() {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 85,
          ),
          Text(
            "Isi Data Diri",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            width: 35,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.clear_rounded)),
        ],
      ),
    );
  }

  Widget nama() {
    final maxLines = 4;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0)),
                hintText: 'Nama Anda'),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          height: maxLines * 30.0,
          child: TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0)),
                hintText: 'Notes'),
          ),
        ),
      ],
    );
  }

  Widget editButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: blueItccColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: () {},
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }


  Widget time() {
    DateTime date = DateTime.now();
    TimeOfDay time = TimeOfDay.now();
    String formattedDate = DateFormat("yyyy/MM/dd").format(date);
    String formattedTime = DateFormat("hh:mm a").format(date);
    return StatefulBuilder(
        builder: (context, setState) => Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Align(
                    child: Text(
                      "Schedule",
                      style: TextStyle(fontSize: 18),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  Row(
                    children: [
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Color.fromRGBO(237, 237, 237, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9))),
                          onPressed: () async {
                            DateTime? newTime = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2300));
                            if (newTime == null) return;
                            setState(() {
                              date = newTime;
                              formattedDate =
                                  DateFormat("yyyy/MM/dd").format(date);
                            });
                          },
                          icon: Icon(
                            Icons.date_range,
                            color: Colors.black,
                          ),
                          label: Text(
                            formattedDate,
                            style: TextStyle(color: Colors.black),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Color.fromRGBO(237, 237, 237, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9))),
                          onPressed: () async {
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (newTime == null) return;
                            setState(() {
                              time = newTime;
                              formattedTime = DateFormat("hh:mm a").format(
                                  DateTime(date.year, date.month, date.day,
                                      time.hour, time.minute));
                            });
                          },
                          icon: Icon(
                            Icons.access_time,
                            color: Colors.black,
                          ),
                          label: Text(
                            formattedTime,
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  )
                ],
              ),
            ));
  }

  // show the dialog
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0)), //this right here
          child: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  popUpHeader(),
                  nama(),
                  dropDown2(),
                //  time(),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Text("Pilih Jadwal", style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 13),)
                  ),
                  checkBox(),
                  editButton(),
                ],
              ),
            ),
          ),
        );
      });
}

class checkBox extends StatefulWidget {
  checkBox({Key? key}) : super(key: key);
  
  @override
  State<checkBox> createState() => _checkBoxState();
}

class _checkBoxState extends State<checkBox> {
  Map<String, bool> _checkboxValues = {
    'Senin, 28 April 2023': false,
    'Selasa, 29 April 2023': false,
    'Rabu, 30 April 2023': false,
    // Add more checkboxes with their initial checked state as needed
  };
  @override
  bool _isChecked = false;
  Widget build(BuildContext context) {
    return Column(
      children: _checkboxValues.keys.map((String key) {
        return CheckboxListTile(
          title: Text(key),
          value: _checkboxValues[key],
          onChanged: (bool? value) {
            setState(() {
              _checkboxValues[key] = value ?? false;
            });
          },
        );
      }).toList(),
    );
  }
}


class dropDown2 extends StatefulWidget {
  dropDown2({Key? key}) : super(key: key);

  @override
  State<dropDown2> createState() => dropDown2State();
}

class dropDown2State extends State<dropDown2> {
  String? _selectedValue;
  List<String> listOfValue = [
    'Word',
    'Excel',
    'Power Point'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
            value: _selectedValue,
            hint: Text(
              'Microsoft Office Specialist',
            ),
            isExpanded: true,
            onChanged: (value) {
              setState(() {
                _selectedValue = _selectedValue;
              });
            },
            onSaved: (value) {
              setState(() {
                _selectedValue = _selectedValue;
              });
            },
            items: listOfValue.map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(
                  val.toString(),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

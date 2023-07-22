import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:itcc_mobile/shared/thame.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

class customFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double heigth;
  final VoidCallback onPress;
  const customFilledButton(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      this.heigth = 46,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heigth,
      child: TextButton(
          onPressed: onPress,
          style: TextButton.styleFrom(
              backgroundColor: blueItccColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(56))),
          child: Text(
            title,
            style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          )),
    );
  }
}

class customIconFilledButton extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPress;
  const customIconFilledButton(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 40,
      child: TextButton(
          onPressed: onPress,
          style: TextButton.styleFrom(
              side: BorderSide(width: 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Row(
            children: [
              Container(
                  margin:
                      EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 35),
                  child: Image(image: AssetImage(icon))),
              Text(
                title,
                style:
                    blackTextStyle.copyWith(fontSize: 13, fontWeight: semiBold),
              )
            ],
          )),
    );
  }
}

class customTextButton extends StatelessWidget {
  final String title;
  final double width;
  final double heigth;
  final VoidCallback onPress;
  const customTextButton(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      this.heigth = 46,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heigth,
      child: TextButton(
          onPressed: onPress,
          child: Text(
            title,
            style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
          )),
    );
  }
}

class titleView extends StatelessWidget {
  final String TextTitle;
  const titleView({Key? key, required this.TextTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        TextTitle,
        style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
      ),
    );
  }
}

Widget iconview() {
  return Container(
    height: 90,
    margin: const EdgeInsets.only(top: 100),
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/icon/itcc_logo.png"), fit: BoxFit.fill)),
  );
}

Widget inputText(
    var _TextController, String inputTitle, bool obsecure, var validator) {
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
          controller: _TextController,
          obscureText: obsecure,
          validator: validator,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
      ],
    ),
  );
}

class dropDown extends StatefulWidget {
  dropDown({Key? key}) : super(key: key);

  @override
  State<dropDown> createState() => dropDownState();
}

class dropDownState extends State<dropDown> {
  String? _selectedValue;
  List<String> listOfValue = [
    'Teknik Informatika',
    'Teknik Sipil',
    'Teknik Elektro',
    'Teknik Mesin'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jurusan",
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
            value: _selectedValue,
            hint: Text(
              'Teknik',
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

class itemDo extends StatelessWidget {
  final title;
  final iconUrl;
  final VoidCallback? onTap;
  const itemDo(
      {Key? key, required this.title, required this.iconUrl, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: onTap,
          child: Container(
            margin: EdgeInsets.only(top: 14, bottom: 8),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              margin: EdgeInsets.all(22),
              child: Image.asset(iconUrl),
            ),
          ),
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 13, fontWeight: semiBold),
        )
      ],
    );
  }
}

Widget transactionItem(
    String icon, String Judul, String Sub, String angka, String Tanggal,VoidCallback? Ontap) {
  return GestureDetector(
    onTap: Ontap,
    child: Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 40,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Judul,
                  style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                ),
                Text(
                  Sub,
                  style: greyTextStyle.copyWith(fontSize: 10, fontWeight: light),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "Rp ${angka}",
                  style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 13),
                ),
                Row(
                  children: [
                    Text(
                      "Registration Open ",
                      style: greyTextStyle.copyWith(fontSize: 8),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      Tanggal,
                      style:
                          blueTextStyle.copyWith(fontSize: 8, fontWeight: bold),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget sendAgainitem(String icon, String nama) {
  return Container(
    width: 90,
    height: 120,
    margin: EdgeInsets.only(top: 14, right: 17),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(22),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(fit: BoxFit.cover, image: AssetImage(icon))),
        ),
        Text(
          nama,
          style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),
        )
      ],
    ),
  );
}

Widget popUpItem() {
  return Container(
    width: 300,
    height: 150,
  );
}

Widget friendlyTipsItem(String image, String title, String url) {
  return Container(
    margin: EdgeInsets.only(top: 10, right: 5),
    width: 145,
    height: 175,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: whiteColor),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            width: 155,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          ),
        )
      ],
    ),
  );
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
            "Detail Kegiatan",
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
  Widget textField() {
    final maxLines = 4;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0)),
                hintText: 'Add Task'),
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
              primary: const Color.fromRGBO(207, 33, 42, 1),
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
                  textField(),
                  time(),
                  level(),
                  editButton(),
                ],
              ),
            ),
          ),
        );
      });
}

class ImageSlide extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/01.png',
    'assets/images/02.png',
    'assets/images/03.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 100,
      width: 3000,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 100,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
        items: imageList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: 500,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Colors.grey,
                ),
                child: Image.asset(
                  i,
                  fit: BoxFit.fill,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

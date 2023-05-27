import 'dart:async';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itcc_mobile/screen/home_screen.dart';
import 'package:itcc_mobile/shared/thame.dart';

class otpScreen extends StatelessWidget {
  const otpScreen({
    Key? key,
    required this.otpController,
  }) : super(key: key);
  final TextEditingController otpController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        controller: otpController,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
          hintText: ('0'),
        ),
        onSaved: (value) {},
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.myauth}) : super(key: key);
  final EmailOTP myauth;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();

  String otpController = "1234";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Kode OTP",
            style: GoogleFonts.montserrat(fontWeight: bold, fontSize: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              otpScreen(
                otpController: otp1Controller,
              ),
              otpScreen(
                otpController: otp2Controller,
              ),
              otpScreen(
                otpController: otp3Controller,
              ),
              otpScreen(
                otpController: otp4Controller,
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Kode OTP Telah Dikirim\nSilahkan Cek Email Anda", textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: blueItccColor
            ),
            onPressed: () async {
              if (await widget.myauth.verifyOTP(
                      otp: otp1Controller.text +
                          otp2Controller.text +
                          otp3Controller.text +
                          otp4Controller.text) ==
                  true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("OTP is verified"),
                ));
                Timer(Duration(seconds: 3), () {
                  Get.offAll(homeScreen());
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Invalid OTP"),
                ));
              }
            },
            child: const Text(
              "Confirm",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

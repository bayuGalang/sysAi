import 'package:flutter/material.dart';
import 'package:itcc_mobile/screen/login_screen.dart';
import 'package:itcc_mobile/screen/register_screen.dart';
import 'package:itcc_mobile/shared/thame.dart';
import 'package:itcc_mobile/widget/custom_widget.dart';

class uploadKTP extends StatefulWidget {
  const uploadKTP({Key? key}) : super(key: key);

  @override
  State<uploadKTP> createState() => _uploadKTPState();
}

class _uploadKTPState extends State<uploadKTP> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _pinController = TextEditingController();
    final AssetImage profilPicture;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          iconview(),
          const SizedBox(
            height: 50,
          ),
          titleView(TextTitle: "Verify Your\nAccount"),
          Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: backgroundColor,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/icon/upload_icon.png",
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 16, bottom: 30),
                    child: Text(
                      "KTP/KTM",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: bold),
                    )),
                customFilledButton(title: "Continue", onPress: () {
                  Navigator.pushNamed(context, "signUpSucces");
                }),
              ],
            ),
          ),
          customTextButton(title: "Skir For Now", onPress: () {
            Navigator.pushNamed(context, "signUpSucces");
          }),
        ],
      ),
    );
  }
}

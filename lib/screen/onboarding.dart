import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:itcc_mobile/screen/login_screen.dart';
import 'package:itcc_mobile/screen/register_screen.dart';
import 'package:itcc_mobile/shared/thame.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:itcc_mobile/widget/custom_widget.dart';
import 'package:itcc_mobile/main.dart';
import 'package:firebase_core/firebase_core.dart';

class onboarding_screen extends StatefulWidget {
  const onboarding_screen({Key? key}) : super(key: key);

  @override
  State<onboarding_screen> createState() => _onboarding_screenState();
}

class _onboarding_screenState extends State<onboarding_screen> {
  final Future<FirebaseApp> _FApp = Firebase.initializeApp();
  var curretIndex = 0;
  CarouselController carouselController = CarouselController();
  List<String> titles = [
    "Prove Your\nSkill with Us",
    "Learn From Expert\nTrainer",
    "Start Now"
  ];
  List<String> caption = [
    "Unlock Your Potential\nFor professional success",
    "We provide Expert Trainer for you\nPractical and Need",
    "We will guide you to where\nyou wanted it too"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: FutureBuilder(
          future: _FApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Somthing Went Wrong");
            } else if (snapshot.hasData) {
              print('Conect');
              return Content();
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }

  Widget Content() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          items: [
            Image.asset(
              "assets/images/boardingg1.png",
            ),
            Image.asset(
              "assets/images/boardingg2.png",
            ),
            Image.asset(
              "assets/images/boardingg4.png",
            ),
          ],
          options: CarouselOptions(
              height: 331,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  curretIndex = index;
                });
              }),
          carouselController: carouselController,
        ),
        const SizedBox(
          height: 80,
        ),
        //Text Bawah//
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 24,
          ),
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Text(
                titles[curretIndex],
                style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                caption[curretIndex],
                style: greyTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: curretIndex == 2 ? 38 : 50,
              ),
              if (curretIndex == 0 || curretIndex == 1)
                Row(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 12,
                      height: 12,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              curretIndex == 0 ? blueColor : backgroundColor),
                    ),
                    Container(
                      width: 12,
                      height: 12,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              curretIndex == 1 ? blueColor : backgroundColor),
                    ),
                    Container(
                      width: 12,
                      height: 12,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              curretIndex == 2 ? blueColor : backgroundColor),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextButton(
                          onPressed: () {
                            carouselController.nextPage();
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: blueItccColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(56))),
                          child: Text(
                            "Continue",
                            style: whiteTextStyle.copyWith(
                                fontSize: 16, fontWeight: semiBold),
                          )),
                    )
                  ],
                )
              else
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    customFilledButton(
                        title: "Get Started",
                        onPress: () {
                          Navigator.pushNamed(context, "signUp");
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "signInOptionn");
                          },
                          child: Text(
                            "Sign in",
                            style: greyTextStyle.copyWith(
                                fontSize: 16, fontWeight: semiBold),
                          )),
                    )
                  ],
                ),
            ],
          ),
        )
      ],
    ));
  }
}

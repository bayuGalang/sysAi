import 'package:flutter/material.dart';
import 'package:itcc_mobile/shared/thame.dart';
import 'package:itcc_mobile/widget/custom_widget.dart';

class signUpSucces extends StatelessWidget {
  const signUpSucces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text("Let's Get Started", bold, 20),
            const SizedBox(height: 26,),
            text("Your Account Registration \nwas Successful!", medium, 16),
            const SizedBox(height: 20,),
            customFilledButton(width: 182,title: "Get Started", onPress: (){
              Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
            },)
          ],
        ),
      ),
    );
  }

  Widget text(String judul, var weight, double size){
    return Container(
      child: Text(
        judul,
        style: blackTextStyle.copyWith(
          fontWeight: weight,
          fontSize: size,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

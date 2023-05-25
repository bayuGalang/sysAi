import 'package:flutter/material.dart';
import 'package:itcc_mobile/shared/thame.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:itcc_mobile/repository/user_repository/autentication.dart';
import '../widget/custom_widget.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomAppBar(
        color: backgroundColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: null,
            selectedItemColor: blueColor,
            unselectedItemColor: blackColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle:
                blueTextStyle.copyWith(fontSize: 10, fontWeight: medium),
            unselectedLabelStyle:
                blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon/fi_layers-3.png',
                    width: 20,
                    color: blueColor,
                  ),
                  label: 'Overeview'),
              BottomNavigationBarItem(
                  icon:
                      Image.asset('assets/icon/fi_file-text-2.png', width: 20),
                  label: 'History'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icon/fi_trending-up-2.png',
                      width: 20),
                  label: "News"),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icon/fi_gift-2.png', width: 20),
                  label: 'Reward'),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueItccColor,
        onPressed: () {
          AutenticationRepository.instance.logout();
        },
        child: Image.asset(
          'assets/icon/cs.png',
          width: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          Profile(),
          walletCard(),
          ImageSlide(),
          layanan(),
          latestTransaction(),
          sendAgain(),
          friendlyTips()
        ],
      ),
    );
  }

  Widget Profile() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Howdy',
                style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
              ),
              Text(
                'Galang Bayu W',
                style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            width: 130,
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/image.png'))),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
                child: Center(
                  child: Icon(
                    Icons.check_circle,
                    size: 18,
                    color: greenColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget walletCard() {
    return Container(
      width: double.infinity,
      height: 220,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/card_item.png'))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [whiteColor, infoColor],
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
              ).createShader(bounds);
            },
            child: Text(
              "Galang Bayu W",
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
                color: Colors.white,
              ),
            ),
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [whiteColor, infoColor],
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
              ).createShader(bounds);
            },
            child: Text(
              'S1' + ' ' + 'Teknik Informatika',
              style: whiteTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
                letterSpacing: 2,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [whiteColor, infoColor],
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
              ).createShader(bounds);
            },
            child: Text(
              "Nomor Induk Mahasiswa",
              style: whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
                color: Colors.white,
              ),
            ),
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [whiteColor, infoColor],
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
              ).createShader(bounds);
            },
            child: Text(
              "201931028",
              style: whiteTextStyle.copyWith(
                fontSize: 19,
                fontWeight: reguler,
                letterSpacing: 4,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget imageSilder(){
  //   return Container(
  //     margin: EdgeInsets.only(top: 20),
  //     padding: EdgeInsets.all(20),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(24),
  //       color: whiteColor
  //     ),
  //     child: ,
  //   );
  // }
  Widget layanan() {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 14),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Do Something",
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
           child:Row(
              children: [
                itemDo(
                  title: 'Pretest',
                  iconUrl: 'assets/images/exam-results.png',
                  onTap: () {PopUpx(context);},
                ),
                const SizedBox(
                  width: 16,
                ),
                itemDo(
                  title: 'My Certificate',
                  iconUrl: 'assets/icon/certificate-2.png',
                  onTap: (){Navigator.pushNamed(context, 'sertifikat');},
                ),
                const SizedBox(
                  width: 16,
                ),
                itemDo(
                  title: 'Withdraw',
                  iconUrl: 'assets/icon/fi_upload.png',
                  onTap: (){Navigator.pushNamed(context, 'news');},
                ),
                const SizedBox(
                  width: 16,
                ),
                itemDo(
                  title: 'More',
                  iconUrl: 'assets/icon/more_icon.png',
                  onTap: (){},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget latestTransaction() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: 4,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Latest Transaction',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              children: [
                transactionItem('assets/icon/MOS-Badge.png', 'MOS',
                    "Microsoft Office Specialist", '+ 750.000', "19 Aug"),
                transactionItem('assets/icon/Mikrotik-2.png', 'MTCNA',
                    'Mikrotik', '+ 1.200.000', "29 Aug"),
                transactionItem('assets/icon/MOS-Badge.png', 'MOS',
                    'Microsoft Office Specialist', '+ 750.000', "19 Aug"),
                transactionItem('assets/icon/MCE.png', 'MCE',
                    'Microsoft Certified Educator', '+ 1.200.000', "19 Aug"),
                transactionItem('assets/icon/mcf.png', 'MCF',
                    'Microsoft Certified Fundamental', '+ 1.000.000', "19 Aug"),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget sendAgain() {
    return Container(
      margin: EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Other Student',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                sendAgainitem('assets/images/image.png', 'Galang'),
                sendAgainitem('assets/images/image.png', 'Bayu'),
                sendAgainitem('assets/images/image.png', 'Azki'),
                sendAgainitem('assets/images/image.png', 'Testing'),
                sendAgainitem('assets/images/image.png', 'Testing'),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget friendlyTips() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              'Tips',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                friendlyTipsItem('assets/images/image 16.png',
                    'Best tip for using a credit card', 'abc'),
                SizedBox(
                  width: 20,
                ),
                friendlyTipsItem('assets/images/image 17.png',
                    'Best tip for using a credit card', 'abc'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_launchWhatsApp() async {
  final Uri url = Uri.parse('https://wa.me/6282213053377?text=Hallo,%20perkenalkan%20nama%20saya%20(Nama%20Lengkap),%20dengan%20NIM%20(NIM),%20dari%20Jurusan%20(Jurusan)%20ingin%20bertanya');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

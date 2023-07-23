import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:itcc_mobile/controller/kegiatan_controller.dart';
import 'package:itcc_mobile/controller/profile_controller.dart';
import 'package:itcc_mobile/controller/signUP_controller.dart';
import 'package:itcc_mobile/model/user_model.dart';
import 'package:itcc_mobile/model/kegiatan_model.dart';
import 'package:itcc_mobile/repository/user_repository/autentication.dart';
import 'package:itcc_mobile/screen/listDaftarKegiatan_screen.dart';
import 'package:itcc_mobile/screen/mos.dart';
import 'package:itcc_mobile/screen/mtcna.dart';
import 'package:itcc_mobile/screen/profile_screen.dart';
import 'package:itcc_mobile/screen/listDaftarKegiatan_screen.dart';
import 'package:itcc_mobile/screen/signIn_option_screen.dart';
import 'package:itcc_mobile/shared/thame.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/custom_widget.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(profileController());
    TabController tabcontroller = TabController(length: 4, vsync: this);
    List<Widget> scren = <Widget>[
      Container(
        child: FutureBuilder(
          future: controller.getUserdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel userData = snapshot.data as UserModel;
                return ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    Profile(context, userData.Nama),
                    walletCard(userData.Nim),
                    ImageSlide(),
                    layanan(),
                    jadwal(),
                    sendAgain(),
                    friendlyTips()
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.hasError.toString()),
                );
              } else {
                return Center(
                  child: Text("Something went wrong"),
                );
              }
            } else {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            return SizedBox();
          },
        ),
      ),
      Container(),
      Container(),
      Container(),
    ];
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
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: blueItccColor,
          onPressed: () {
            AutenticationRepository.instance.logout();
            Get.offAll(() => SignInOptionn());
          },
          child: Image.asset(
            'assets/icon/cs.png',
            width: 35,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: GestureDetector(
          onDoubleTap: () {
            Get.to(() => homeScreen());
          },
          child: Center(child: scren.elementAt(_selectedIndex)),
        ));
  }

  Widget Profile(BuildContext context, String Nama) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.off(profileScreen()),
            child: Container(
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
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () => Get.to(profileScreen()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Howdy',
                  style:
                      greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
                ),
                Text(
                  Nama,
                  style:
                      blackTextStyle.copyWith(fontWeight: bold, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget walletCard(String Nim) {
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
              "Mahasiswa",
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
              Nim,
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
            child: Row(
              children: [
                itemDo(
                  title: 'Pretest',
                  iconUrl: 'assets/images/exam-results.png',
                  onTap: () {},
                ),
                const SizedBox(
                  width: 16,
                ),
                itemDo(
                  title: 'My Certificate',
                  iconUrl: 'assets/icon/certificate-2.png',
                  onTap: () {
                    Navigator.pushNamed(context, 'sertifikat');
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                itemDo(
                  title: 'Daftar Lagi',
                  iconUrl: 'assets/icon/fi_upload.png',
                  onTap: () {
                    Navigator.pushNamed(context, 'news');
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                itemDo(
                  title: 'More',
                  iconUrl: 'assets/icon/more_icon.png',
                  onTap: () {},
                )
              ],
            ),
          ),
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

class jadwal extends StatelessWidget {
  const jadwal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: 4,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                Get.to(() => listKegiatanScreen());
              },
              child: Text(
                'Sertifikasi di ITCC',
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              children: [
                transactionItem('assets/icon/Mikrotik-2.png', 'MCNA',
                    'Mikrotik', "1.200.000", "29 Aug", () {
                  Get.to(() => mtcnaScreen());
                }),
                transactionItem('assets/icon/MOS-Badge.png', 'MOS',
                    'Microsoft Office Specialist', "750.000", "19 Aug", () {
                  Get.to(()=> mosScreen());
                    }),
                transactionItem('assets/icon/MCE.png', 'MCE',
                    'Microsoft Certified Educator', "1.200.000", "19 Aug", () {}),
                transactionItem(
                    'assets/icon/mcf.png',
                    'MCF',
                    'Microsoft Certified Fundamental',
                    "1.000.000",
                    "19 Aug",
                    () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class jadwalList extends StatelessWidget {
//   const jadwalList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final kegiatan = Get.put(kegiatanController());
//     return FutureBuilder<List<KegiatanModel>>(
//       future: kegiatan.allKegiatan(),
//       builder: (context, snapshot) {
//         KegiatanModel kg = snapshot.data as KegiatanModel;
//         return Container(
//           margin: EdgeInsets.only(
//             top: 30,
//             left: 4,
//           ),
//           child: Column(
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text(
//                   'Jadwal Kegiatan Terdekat',
//                   style:
//                       blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(top: 14),
//                 padding: const EdgeInsets.all(22),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.white),
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (c, index) {
//                       return Column(
//                         children: [
//                           GestureDetector(
//                             onTap: PopUpx(context),
//                             child: transactionItem(
//                                 'assets/icon/MOS-Badge.png',
//                                 'MOS',
//                                 "Microsoft Office Specialist",
//                                 snapshot.data![index].Harga,
//                                 snapshot.data![index].openDate),
//                           ),
//                           transactionItem('assets/icon/Mikrotik-2.png', 'MTCNA',
//                               'Mikrotik', 1200000, "29 Aug"),
//                           transactionItem('assets/icon/MOS-Badge.png', 'MOS',
//                               'Microsoft Office Specialist', 750000, "19 Aug"),
//                           transactionItem(
//                               'assets/icon/MCE.png',
//                               'MCE',
//                               'Microsoft Certified Educator',
//                               1200000,
//                               "19 Aug"),
//                           transactionItem(
//                               'assets/icon/mcf.png',
//                               'MCF',
//                               'Microsoft Certified Fundamental',
//                               1000000,
//                               "19 Aug"),
//                         ],
//                       );
//                     }),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

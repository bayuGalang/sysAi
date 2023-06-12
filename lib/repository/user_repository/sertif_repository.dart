import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:itcc_mobile/model/sertif_model.dart';

class sertifRepository extends GetxController {
  static sertifRepository get instence => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<sertifModel> sertif(String email) async{
    final snapshoot = await _db.collection('sertif').where("email", isEqualTo: email).get();
    final sertifdata = snapshoot.docs.map((e) => sertifModel.fromSnapshot(e)).single;
    return sertifdata;
  }

}

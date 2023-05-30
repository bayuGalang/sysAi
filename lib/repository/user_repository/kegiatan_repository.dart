import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:itcc_mobile/model/kegiatan_model.dart';

class kegiatanRepository extends GetxController{
  static kegiatanRepository get instence => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<KegiatanModel>> kegiatan() async{
    final snapshoot = await _db.collection('Kegiatan').get();
    final userdata = snapshoot.docs.map((e) => KegiatanModel.fromSnapshot(e)).toList();
    return userdata;
  }
}
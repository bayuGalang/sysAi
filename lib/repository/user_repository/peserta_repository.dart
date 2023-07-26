import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:itcc_mobile/model/peserta_model.dart';

class pesertaRepository extends GetxController{
  static pesertaModel get instence => Get.find();

  final _db = FirebaseFirestore.instance;
  daftar(pesertaModel peserta) async {
    await _db
        .collection("peserta")
        .add(peserta.toJson())
        .whenComplete(
          () => {},
    )
        .catchError((error, stackTerace) {
      print(error.toString());
    });
  }
}
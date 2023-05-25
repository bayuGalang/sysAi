import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:itcc_mobile/model/user_model.dart';

class UserRepositroy extends GetxController {
  static UserRepositroy get instence => Get.find();

  final _db = FirebaseFirestore.instance;

  CreateUser(UserModel user) async {
    await _db
        .collection("Mahasiswa")
        .add(user.toJson())
        .whenComplete(
          () => {},
        )
        .catchError((error, stackTerace) {
      Get.snackbar("Error", "Ada Kendala Login", snackPosition: SnackPosition.BOTTOM);
      print(error.toString());
    });
  }
}

import 'package:get/get.dart';
import 'package:itcc_mobile/repository/user_repository/sertif_repository.dart';
import '../model/sertif_model.dart';
import '../repository/user_repository/autentication.dart';

class sertifController extends GetxController {
  static sertifController get instance => Get.find();

  final _sertifRepo = Get.put(sertifRepository());
  final _authRepo = Get.put(AutenticationRepository());

  getKegiatan()async{
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return await _sertifRepo.sertif(email);
    }
    else{
      return Get.snackbar("Error", "Silahkan Login");
    }
  }
}
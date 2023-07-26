import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itcc_mobile/model/peserta_model.dart';
import 'package:itcc_mobile/repository/user_repository/peserta_repository.dart';

class pesertaController{
  static pesertaController get instence => Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController programController = TextEditingController();
  TextEditingController namaController = TextEditingController();

  final peserta = Get.put(pesertaRepository());

  Future<void> daftar(pesertaModel pesertamdl)async{
    await peserta.daftar(pesertamdl);
  }
}
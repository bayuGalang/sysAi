import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itcc_mobile/model/kegiatan_model.dart';
import 'package:itcc_mobile/repository/user_repository/autentication.dart';
import 'package:itcc_mobile/repository/user_repository/kegiatan_repository.dart';
import 'package:itcc_mobile/repository/user_repository/user_repository.dart';

class kegiatanController extends GetxController {
  static kegiatanController get instance => Get.find();

  final _kegiatanRepo = Get.put(kegiatanRepository());

  Future<KegiatanModel> getKegiatan()async{
    return await _kegiatanRepo.kegiatan();
  }

  Future<List<KegiatanModel>> allKegiatan()async{
    return await _kegiatanRepo.allKegiatan();
  }
}
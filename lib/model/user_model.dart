import 'package:flutter/material.dart';

class UserModel {
  final String? id;
  final String Nim;
  final String Nama;
  final String Email;
  final String Jurusan;
  final String Password;
  final String Angkatan;
  final String Nomor;

  const UserModel(
      {this.id,
      required this.Nim,
      required this.Nama,
      required this.Email,
      required this.Jurusan,
      required this.Password,
      required this.Nomor,
      required this.Angkatan});

  toJson() {
    return {
      "Nama": Nama,
      "Nim": Nim,
      "Email": Email,
      "Nomor": Nomor,
      "Jurusan": Jurusan,
      "Password": Password,
      "Angkatan": Angkatan,
    };
  }


}

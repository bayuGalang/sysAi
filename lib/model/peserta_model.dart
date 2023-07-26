import 'package:cloud_firestore/cloud_firestore.dart';

class pesertaModel{
  final String email;
  final String program;
  final String nama;

  const pesertaModel({required this.email, required this.program, required this.nama});

  toJson() {
    return {
      "email": email,
      "nama": nama,
      "program": program,
    };
  }

  factory pesertaModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return pesertaModel(
        program: data['program'],
        nama: data['nama'],
        email: data['email']);
  }
}
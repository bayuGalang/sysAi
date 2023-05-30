import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class KegiatanModel {
  final String? id;
  final String Nama_kegiatan;
  final String Kegiatan;
  final String openDate;
  final num Harga;

  const KegiatanModel(
      {this.id,
        required this.Nama_kegiatan,
        required this.Harga,
        required this.Kegiatan,
        required this.openDate});

  toJson() {
    return {
      "Nama_kegiatan": Nama_kegiatan,
      "openDate": openDate,
      "Kegiatan": Kegiatan,
      "Harga": openDate,
    };
  }

  factory KegiatanModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return KegiatanModel(
        id: document.id,
        Nama_kegiatan: data['Nama_kegiatan'],
        openDate: data['openDate'],
        Kegiatan: data['Kegiatan'],
        Harga: data['Harga']);
  }
}
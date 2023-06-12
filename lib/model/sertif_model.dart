import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class sertifModel {
  final String kode;
  final String nim;
  final String valid;
  final String email;

  const sertifModel(
      {required this.kode, required this.nim, required this.valid, required this.email});
  factory sertifModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return sertifModel(
      kode: data['kode'],
      email: data['email'],
      nim: data['nim'],
      valid: data['valid'],
    );
  }
}

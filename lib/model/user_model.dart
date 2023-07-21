import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        Nim: data['Nim'],
        Nama: data['Nama'],
        Email: data['Email'],
        Jurusan: data['Jurusan'],
        Password: data['Password'],
        Nomor: data['Nomor'],
        Angkatan: data['Angkatan']);
  }
}

class GoogleUserModel {
  final String uid;
  final String displayName;
  final String email;
  final String photoUrl;

  GoogleUserModel({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.photoUrl,
  });

  factory GoogleUserModel.fromFirebaseUser(User user) {
    return GoogleUserModel(
      uid: user.uid,
      displayName: user.displayName ?? "",
      email: user.email ?? "",
      photoUrl: user.photoURL ?? "",
    );
  }
}


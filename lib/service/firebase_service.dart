import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../ui/widget/snackbar_item.dart';

class FirebaseService {
  Future<bool> signUpEmail(
    BuildContext context, {
    required String username,
    required String email,
    required String pass,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        FirebaseFirestore.instance.runTransaction((transaction) async {
          DocumentReference documentReference = FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid);
          DocumentSnapshot snapshot = await transaction.get(documentReference);

          if (!snapshot.exists) {
            documentReference.set({
              'username': username,
              'email': email,
              'income': 0,
              'spending': 0,
              'photo_profile': '',
              'created_at': DateTime.now(),
              'updated_at': DateTime.now(),
            });
            return true;
          } else {
            documentReference.update({
              'updated_at': DateTime.now(),
            });
            return true;
          }
        });
      });
      return true;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, title: "Error: ${e.code}");
      return false;
    } on SocketException {
      showSnackBar(context, title: "Koneksi Internet Error");
      return false;
    }
  }

  Future<bool> signInEmail(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, title: "Error: ${e.code}");
      return false;
    } on SocketException {
      showSnackBar(context, title: "Koneksi Internet Error");
      return false;
    }
  }

  Future<bool> editProfile(
    BuildContext context, {
    required String name,
  }) async {
    try {
      DocumentReference userDocument = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid);

      FirebaseFirestore.instance.runTransaction(
        (transaction) async {
          transaction.update(userDocument, {
            'username': name,
          });
          return true;
        },
      );
      return true;
    } on PlatformException {
      return false;
    } on SocketException {
      showSnackBar(context, title: 'Tidak ada koneksi internet');
      return false;
    } on FirebaseException {
      return false;
    }
  }
}

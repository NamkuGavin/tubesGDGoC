import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
              'total_money': 0,
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

  Future<bool> addTransaction(
    BuildContext context, {
    required String type,
    required num total,
    required String category,
    required String date,
    required String desc,
  }) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      String day = DateFormat('EEE').format(DateTime.now());
      String formattedDate = DateFormat('d MMM yyyy').format(DateTime.now());

      DocumentReference userDocument =
          FirebaseFirestore.instance.collection('users').doc(uid);

      DocumentReference transactionDocument = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('transaction')
          .doc();

      FirebaseFirestore.instance.runTransaction(
        (transaction) async {
          DocumentSnapshot userSnapshot = await transaction.get(userDocument);
          DocumentSnapshot transactionSnapshot =
              await transaction.get(transactionDocument);

          num oldBalance = userSnapshot['total_money'];
          num newBalance =
              type == 'income' ? oldBalance + total : oldBalance - total;
          num oldValueType = userSnapshot[type];
          num newValueType = oldValueType + total;

          if (!transactionSnapshot.exists) {
            await transactionDocument.set({
              'type': type,
              'total': total,
              'category': category,
              'date': date,
              'desc': desc,
              'day': day,
              'week': formattedDate,
              'created_at': DateTime.now(),
              'updated_at': DateTime.now(),
            }).then(
              (value) =>
                  addDetailTransaction(context, type: type, total: total),
            );
          }

          transaction.update(userDocument, {
            'total_money': newBalance,
            type: newValueType,
          });
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

  Future<bool> addDetailTransaction(
    BuildContext context, {
    required String type,
    required num total,
  }) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      String day = DateFormat('EEE').format(DateTime.now());
      String formattedDate = DateFormat('d MMM yyyy').format(DateTime.now());

      DocumentReference detailTransactionDocument = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection(type)
          .doc(formattedDate);

      FirebaseFirestore.instance.runTransaction(
        (transaction) async {
          DocumentSnapshot detailTransactionSnapshot =
              await transaction.get(detailTransactionDocument);

          if (!detailTransactionSnapshot.exists) {
            detailTransactionDocument.set({
              'total': total,
              'day': {day: total},
              'last_day': day,
            });
            return true;
          } else {
            num oldValueTotal = detailTransactionSnapshot['total'];
            num newValueTotal = oldValueTotal + total;
            String lastDay = detailTransactionSnapshot['last_day'];

            if (lastDay == day) {
              num oldValueDay = detailTransactionSnapshot['day'][day];
              num newValueDay = oldValueDay + total;

              transaction.update(
                detailTransactionDocument,
                {
                  'total': newValueTotal,
                  'day.$day': newValueDay,
                },
              );
              return true;
            } else {
              detailTransactionDocument.set(
                {
                  'total': newValueTotal,
                  'day': {day: total},
                  'last_day': day,
                },
                SetOptions(merge: true),
              );
              return true;
            }
          }
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

  Future<bool> deleteTransaction(
    BuildContext context, {
    required String docId,
    required String type,
    required num total,
    required String day,
    required String week,
  }) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      DocumentReference userDocument =
          FirebaseFirestore.instance.collection('users').doc(uid);

      DocumentReference transactionDocument = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('transaction')
          .doc(docId);

      DocumentReference detailTransactionDocument = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection(type)
          .doc(week);

      FirebaseFirestore.instance.runTransaction(
        (transaction) async {
          DocumentSnapshot userSnapshot = await transaction.get(userDocument);
          DocumentSnapshot detailTransactionSnapshot =
              await transaction.get(detailTransactionDocument);

          num oldTotalBalance = userSnapshot['total_money'];
          num oldValueUser = userSnapshot[type];
          num oldValueDetail = detailTransactionSnapshot['day'][day];
          num oldValueDetailTotal = detailTransactionSnapshot['total'];

          num newTotalBalance = type == 'income'
              ? oldTotalBalance - total
              : oldTotalBalance + total;
          num newValueUser = oldValueUser - total;
          num newValueDetail = oldValueDetail - total;
          num newValueDetailTotal = oldValueDetailTotal - total;

          await transactionDocument.delete().then((value) {
            transaction.update(detailTransactionDocument, {
              'total': newValueDetailTotal,
              'day.$day': newValueDetail,
            });

            transaction.update(userDocument, {
              type: newValueUser,
              'total_money': newTotalBalance,
            });
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

  Future<bool> editTransaction(
    BuildContext context, {
    required String docId,
    required String type,
    required num total,
    required num oldTotal,
    required String category,
    required String date,
    required String desc,
    required String day,
    required String week,
  }) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      DocumentReference userDocument =
          FirebaseFirestore.instance.collection('users').doc(uid);

      DocumentReference transactionDocument = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('transaction')
          .doc(docId);

      DocumentReference detailTransactionDocument = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection(type)
          .doc(week);

      FirebaseFirestore.instance.runTransaction(
        (transaction) async {
          DocumentSnapshot userSnapshot = await transaction.get(userDocument);
          DocumentSnapshot detailTransactionSnapshot =
              await transaction.get(detailTransactionDocument);

          num oldTotalBalance = userSnapshot['total_money'];
          num oldValueUser = userSnapshot[type];
          num oldValueDetail = detailTransactionSnapshot['day'][day];
          num oldValueDetailTotal = detailTransactionSnapshot['total'];

          num newTotalBalance = type == 'income'
              ? (oldTotalBalance - oldTotal) + total
              : oldTotalBalance + (oldTotal - total);

          num newValueUser = (oldValueUser - oldTotal) + total;

          num newValueDetail = (oldValueDetail - oldTotal) + total;

          num newValueDetailTotal = (oldValueDetailTotal - oldTotal) + total;

          transaction.update(transactionDocument, {
            'type': type,
            'total': total,
            'category': category,
            'date': date,
            'desc': desc,
            'day': day,
            'updated_at': DateTime.now(),
          });

          transaction.update(detailTransactionDocument, {
            'total': newValueDetailTotal,
            'day.$day': newValueDetail,
          });

          transaction.update(userDocument, {
            type: newValueUser,
            'total_money': newTotalBalance,
          });
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

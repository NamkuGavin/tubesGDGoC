import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalBalance extends StatelessWidget {
  TotalBalance({super.key});

  final _document = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: _document.snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return Text(
            "RP. ${data['total_money']}",
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          );
        } else {
          return Text("RP. -",
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600));
        }
      },
    );
  }
}

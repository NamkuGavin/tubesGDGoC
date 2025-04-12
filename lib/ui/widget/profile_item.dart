import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileItem extends StatelessWidget {
  ProfileItem({super.key});

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

          return Column(
            children: [
              CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 50,
                  child: Icon(Icons.person_3_outlined)),
              SizedBox(height: 24),
              Text(data['username'],
                  style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center),
              Text(data['email'],
                  style: GoogleFonts.inter(), textAlign: TextAlign.center),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

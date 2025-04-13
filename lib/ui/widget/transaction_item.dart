import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionItem extends StatelessWidget {
  final bool isPemasukan;
  TransactionItem({super.key, this.isPemasukan = true});

  final _document = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: _document.snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.data()!.isEmpty) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                  color: isPemasukan ? Color(0xFF85EE8C) : Color(0xFFDB6C6C),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(isPemasukan ? "Pemasukan" : "Pengeluaran",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500, fontSize: 10)),
                      SizedBox(height: 8),
                      SizedBox(
                        width: 84,
                        child: Text("-",
                            style:
                                GoogleFonts.inter(fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Image.asset(
                      isPemasukan
                          ? 'assets/icons/trend_up.png'
                          : 'assets/icons/trend_down.png',
                      width: 25),
                ],
              ),
            );
          }

          var data = snapshot.data!;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: isPemasukan ? Color(0xFF85EE8C) : Color(0xFFDB6C6C),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isPemasukan ? "Pemasukan" : "Pengeluaran",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500, fontSize: 10),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: 84,
                      child: Text(
                        isPemasukan
                            ? "Rp. ${data['income']}"
                            : "Rp. ${data['spending']}",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Image.asset(
                    isPemasukan
                        ? "assets/icons/trend_up.png"
                        : "assets/icons/trend_down.png",
                    width: 25),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

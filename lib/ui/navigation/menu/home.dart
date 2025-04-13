import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_gdgoc/ui/widget/transaction_history.dart';
import 'package:tubes_gdgoc/ui/transaction/add_income.dart';
import 'package:tubes_gdgoc/ui/transaction/add_spending.dart';

import '../../widget/transaction_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<String> getUsername() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return userDoc['username'];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.fromLTRB(
                  width < 600 ? 30.0 : 32.0, // left
                  35.0,                      // top
                  width < 600 ? 30.0 : 32.0, // right
                  0.0,                       // bottom
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<String>(
                      future: getUsername(),
                      builder: (context, snapshot) {
                        return Text(
                          'Hai, ${snapshot.data}',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500, fontSize: 30),
                        );
                      },
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Pendapatan dan Pengeluaran kamu bulan ini",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TransactionItem(),
                          TransactionItem(isPemasukan: false),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    _headerTransaksi(),
                    SizedBox(height: 20),
                    TransactionHistory(isHome: true),
                    SizedBox(height: 20),
                    _headerArtikel()
                  ],
                ))));
  }

  Widget _headerTransaksi() {
    return Row(
      children: [
        Image.asset('assets/icons/transaction_history.png',
            color: Color(0xFF3C7E53), width: 25, height: 25),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Transaksi",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 12)),
            Text("Transaksi anda selama ini",
                style: GoogleFonts.inter(fontSize: 12)),
          ],
        ),
      ],
    );
  }

  Widget _headerArtikel() {
    return Row(
      children: [
        Image.asset('assets/icons/article.png',
            color: Color(0xFF3C7E53), width: 25, height: 25),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Artikel",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 12)),
            Text("Artikel seputar ekonomi saat ini",
                style: GoogleFonts.inter(fontSize: 12)),
          ],
        ),
      ],
    );
  }
}



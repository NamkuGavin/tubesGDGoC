import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_gdgoc/common/list_data.dart';
import 'package:tubes_gdgoc/model/article_model.dart';
import 'package:tubes_gdgoc/ui/widget/article_item.dart';
import 'package:tubes_gdgoc/ui/widget/transaction_history.dart';
import 'package:tubes_gdgoc/ui/transaction/add_income.dart';
import 'package:tubes_gdgoc/ui/transaction/add_spending.dart';

import '../../widget/transaction_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _document = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.fromLTRB(
            width < 600 ? 30.0 : 32.0, // left
            35.0, // top
            width < 600 ? 30.0 : 32.0, // right
            0.0, // bottom
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerHome(),
              SizedBox(height: 2),
              Text("Pendapatan dan Pengeluaran kamu,",
                  style: TextStyle(fontSize: 14)),
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
              _headerArtikel(),
              ListView.builder(
                padding: EdgeInsets.only(top: 20),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ListData.article.length,
                itemBuilder: (context, index) {
                  return ArticleItem(
                      id: ListData.article[index].id,
                      judul: ListData.article[index].judul,
                      subjudul: ListData.article[index].subjudul,
                      tanggalPosting: ListData.article[index].tanggalPosting,
                      isiArtikel: ListData.article[index].isiArtikel);
                },
              )
            ],
          )),
    )));
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

  Widget _headerHome() {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: _document.snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          if (!snapshot.data!.exists) {
            return Text('Hai, -',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 17));
          }
          var data = snapshot.data!;

          return Text('Hai, ${data['username'].toString().split(' ').first}',
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 17));
        } else {
          return Text('Hai, -',
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 17));
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_gdgoc/common/navigate.dart';

class ArticlePage extends StatelessWidget {
  final int id;
  final String judul;
  final String subjudul;
  final String tanggalPosting;
  final String isiArtikel;

  const ArticlePage(
      {super.key,
      required this.id,
      required this.judul,
      required this.subjudul,
      required this.tanggalPosting,
      required this.isiArtikel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel', style: GoogleFonts.inter()),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(judul,
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w700)),
              SizedBox(height: 10),
              Text(subjudul,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
              Text(
                tanggalPosting,
                style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              SizedBox(height: 16),
              Text(isiArtikel,
                  style: GoogleFonts.inter(), textAlign: TextAlign.justify),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleItem extends StatelessWidget {
  final int id;
  final String judul;
  final String subjudul;
  final String tanggalPosting;
  final String isiArtikel;

  const ArticleItem(
      {super.key,
      required this.id,
      required this.judul,
      required this.subjudul,
      required this.tanggalPosting,
      required this.isiArtikel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigate.navigatorPush(
            context,
            ArticlePage(
                id: id,
                judul: judul,
                subjudul: subjudul,
                tanggalPosting: tanggalPosting,
                isiArtikel: isiArtikel));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          border: BorderDirectional(
            bottom: BorderSide(color: Color(0XFFD7D7D7)),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberCircle(number: id),
              ],
            ),
            SizedBox(width: 15),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(judul,
                      style: GoogleFonts.inter(
                          fontSize: 13, fontWeight: FontWeight.w500),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis),
                  //SizedBox(height: 2),
                  Text(tanggalPosting, style: GoogleFonts.inter(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NumberCircle extends StatelessWidget {
  final int number;

  const NumberCircle({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: Color(0xFFBCCCDC),
      child: Text(
        '$number',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../service/firebase_service.dart';

class TransactionHistory extends StatefulWidget {
  final bool isHome;
  const TransactionHistory({super.key, this.isHome = false});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final _collection = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('transaction');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _collection.orderBy('created_at', descending: true).snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('Data masih kosong'),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.isHome
                ? snapshot.data!.docs.length < 3
                    ? snapshot.data!.docs.length
                    : 3
                : snapshot.data!.docs.length,
            itemBuilder: (_, index) {
              final data = snapshot.data!.docs[index];
              final type = data['type'];

              return GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                      color: Color(0XFFF4F6F9),
                      borderRadius: BorderRadius.circular(7.5)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 35,
                        height: 35,
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: type == 'income'
                              ? Color(0xFF85EE8C)
                              : Color(0xFFDB6C6C),
                        ),
                        child: Image.asset(
                            type == 'income'
                                ? "assets/icons/trend_up.png"
                                : "assets/icons/trend_down.png",
                            width: 20),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['category'],
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500, fontSize: 12)),
                          Text(data['desc'],
                              style: GoogleFonts.inter(fontSize: 12))
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              '${type == 'income' ? '+' : '-'} ${data['total']}',
                              style: GoogleFonts.inter(
                                  color: type == 'income'
                                      ? Color(0xFF5C9F61)
                                      : Color(0xFFDB6C6C),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12)),
                          SizedBox(height: 3),
                          Text(data['date'],
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500, fontSize: 12)),
                        ],
                      ),
                      SizedBox(width: 12),
                      GestureDetector(
                          onTap: () async {
                            await FirebaseService().deleteTransaction(
                              context,
                              docId: data.id,
                              type: type == 'income' ? 'income' : 'spending',
                              total: data['total'],
                              day: data['day'],
                              week: data['week'],
                            );
                          },
                          child: Icon(Icons.delete_forever,
                              color: Colors.redAccent))
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}

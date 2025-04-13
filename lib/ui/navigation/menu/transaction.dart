import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_gdgoc/ui/transaction/add_income.dart';
import 'package:tubes_gdgoc/ui/transaction/add_spending.dart';
import 'package:tubes_gdgoc/ui/widget/total_balance.dart';
import 'package:tubes_gdgoc/ui/widget/transaction_history.dart';

import '../../../common/navigate.dart';
import '../../widget/transaction_item.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 15),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 12),
              Text("Total Saldo",
                  style: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w600)),
              TotalBalance(),
              SizedBox(height: 20),
              _headerItem(),
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
              Expanded(child: TransactionHistory()),
              _button("Tambah Pemasukan", Color(0xFF5EC57E), () {
                Navigate.navigatorPush(context, AddIncome());
              }),
              SizedBox(height: 12),
              _button("Tambah Pengeluaran", Color(0xFFDB6C6C), () {
                Navigate.navigatorPush(context, AddSpending());
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerItem() {
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

  Widget _button(String text, Color color, Function()? onPress) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color,
          minimumSize: Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.inter(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
      onPressed: onPress,
      child: Text(text),
    );
  }
}

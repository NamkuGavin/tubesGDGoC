import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tubes_gdgoc/ui/navigation/menu/home.dart';
import 'package:tubes_gdgoc/ui/navigation/menu/profile.dart';
import 'package:tubes_gdgoc/ui/navigation/menu/transaction.dart';

import '../../common/notifier.dart';

class ButtonNav extends StatefulWidget {
  const ButtonNav({super.key});

  @override
  State<ButtonNav> createState() => _ButtonNavState();
}

class _ButtonNavState extends State<ButtonNav> {
  final List<Widget> _children = [
    HomeScreen(),
    TransactionScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppState>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: _children[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: provider.onBarTapped,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/home.png',
                  width: size.width * 0.08),
              activeIcon: Image.asset('assets/icons/home_active.png',
                  width: size.width * 0.08, color: Color(0xFF428C57)),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/transaction.png',
                  width: size.width * 0.08),
              activeIcon: Image.asset('assets/icons/transaction_active.png',
                  width: size.width * 0.08, color: Color(0xFF428C57)),
              label: 'Transaksi'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/profile.png',
                  width: size.width * 0.08),
              activeIcon: Image.asset('assets/icons/profile_active.png',
                  width: size.width * 0.08, color: Color(0xFF428C57)),
              label: 'Profile'),
        ],
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
        unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w500),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Color(0xFF428C57),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 5,
      ),
    );
  }
}

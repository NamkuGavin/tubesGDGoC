import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_gdgoc/ui/auth/login_screen.dart';
import 'package:tubes_gdgoc/ui/edit_profile/edit_profile_screen.dart';

import '../../../common/navigate.dart';
import '../../widget/profile_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            children: [
              ProfileItem(),
              SizedBox(height: 16),
              Divider(color: Color(0XFFECEEF2), thickness: 1),
              SizedBox(height: 32),
              _menuProfile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuProfile() {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            _button(
                onPress: () {
                  Navigate.navigatorPush(context, EditProfileScreen());
                },
                icon: Icons.person,
                title: 'Edit Profil'),
            SizedBox(height: 16),
            _button(
                onPress: () async {
                  await FirebaseAuth.instance.signOut();
                  if (!mounted) return;
                  Navigate.navigatorPushAndRemove(context, LoginScreen());
                },
                icon: Icons.logout,
                title: 'Keluar',
                isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget _button({
    required void Function() onPress,
    required IconData icon,
    required String title,
    bool isLogout = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(12.5),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(12.5)),
              ),
              child: Center(
                  child:
                      Icon(icon, color: isLogout ? Colors.red : Colors.black)),
            ),
            SizedBox(width: 15),
            Text(title,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    color: isLogout ? Colors.red : Colors.black)),
            Spacer(),
            Icon(Icons.navigate_next_sharp)
          ],
        ),
      ),
    );
  }
}

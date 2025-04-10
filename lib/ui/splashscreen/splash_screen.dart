import 'dart:async';

import 'package:flutter/material.dart';

import '../../common/navigate.dart';
import '../auth/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigate.navigatorPushAndRemove(
        context,
        LoginScreen(),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo/UangKu_Logo.png',
                    width: screenWidth * 0.5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

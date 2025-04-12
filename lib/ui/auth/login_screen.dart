import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_gdgoc/common/navigate.dart';
import 'package:tubes_gdgoc/common/validate.dart';
import 'package:tubes_gdgoc/ui/navigation/buttonNav.dart';

import '../../service/firebase_service.dart';
import '../widget/custom_textfield.dart';
import '../widget/googleSignIn_button.dart';
import '../widget/loading_animation.dart';
import 'regiter_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier _isLoad = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/logo/UangKu_Logo.png",
                            width: size.width * 0.5),
                        SizedBox(height: 24),
                        Text("Selamat Datang",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500, fontSize: 15)),
                        SizedBox(height: 12),
                        Text("Masukkan Email dan Kata Sandi untuk login",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500, fontSize: 12)),
                        SizedBox(height: 36),
                        CustomTextFormField(
                            label: "Masukkan email",
                            controller: _emailController,
                            textInputType: TextInputType.emailAddress,
                            validator: (value) =>
                                ValidatorCode().emailValidator(value)),
                        SizedBox(height: 10),
                        CustomTextFormField(
                            label: "Masukkan kata sandi",
                            controller: _passwordController,
                            isPassword: true,
                            validator: (value) =>
                                ValidatorCode().passwordValidator(value)),
                        SizedBox(height: 24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF5EC57E),
                              minimumSize: Size(double.infinity, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              textStyle: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _isLoad.value = true;
                              await FirebaseService()
                                  .signInEmail(
                                    context,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  )
                                  .then(
                                    (value) => value
                                        ? Navigate.navigatorPushAndRemove(
                                            context, const ButtonNav())
                                        : null,
                                  );
                              _isLoad.value = false;
                            }
                          },
                          child: Text("Masuk"),
                        ),
                        // SizedBox(height: 16),
                        // Text("Atau",
                        //     style: GoogleFonts.inter(
                        //         fontWeight: FontWeight.w500,
                        //         fontSize: 12,
                        //         color: Color(0xFFB5B5B5))),
                        // SizedBox(height: 16),
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: SignInGoogleButton(),
                        // ),
                        SizedBox(height: 30),
                        RichText(
                          text: TextSpan(
                            text: "Belum punya akun? ",
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                            children: [
                              TextSpan(
                                text: "Daftar",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Color(0xFF448E5D)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigate.navigatorPush(
                                      context, RegisterScreen()),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _isLoad,
              builder: (context, value, _) => Visibility(
                visible: value,
                child: LoadingAnimation(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

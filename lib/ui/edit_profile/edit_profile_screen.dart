import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_gdgoc/common/validate.dart';

import '../../service/firebase_service.dart';
import '../widget/loading_animation.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final _document = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _isLoad = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profil",
          style: GoogleFonts.inter(color: Color(0XFF363940)),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: _document.get(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!;
                  _usernameController.text = data['username'];

                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                                backgroundColor: Color(0XFFE7E7E7),
                                radius: 50,
                                child: Icon(Icons.person_3_outlined)),
                          ),
                          SizedBox(height: 32),
                          Text("Username",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500)),
                          SizedBox(height: 8),
                          _textForm(
                              hint: "Masukkan username",
                              controller: _usernameController,
                              validator: (value) =>
                                  ValidatorCode().nameValidator(value)),
                          SizedBox(height: 16),
                          Text("Email",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500)),
                          SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            height: 50,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(data['email'],
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500, fontSize: 12)),
                          ),
                          SizedBox(height: 32),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFF5EC57E),
                                minimumSize: Size(double.infinity, 48),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                textStyle: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600)),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _isLoad.value = true;
                                await FirebaseService()
                                    .editProfile(context,
                                        name: _usernameController.text)
                                    .then((value) =>
                                        value ? Navigator.pop(context) : null);
                                _isLoad.value = false;
                              }
                            },
                            child: Text("Edit"),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(child: LoadingAnimation());
                }
              },
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _isLoad,
            builder: (context, value, _) =>
                Visibility(visible: value, child: LoadingAnimation()),
          ),
        ],
      ),
    );
  }

  Widget _textForm(
      {required String hint,
      required TextEditingController controller,
      TextInputType textInputType = TextInputType.text,
      String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 12),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0XFFE7E7E7)),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0XFFE7E7E7)),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF5EC57E)),
            borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.redAccent),
            borderRadius: BorderRadius.circular(8)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.redAccent),
            borderRadius: BorderRadius.circular(8)),
        hintText: hint,
        hintStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: Color(0XFF9B9B9B)),
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 16),
      ),
    );
  }
}

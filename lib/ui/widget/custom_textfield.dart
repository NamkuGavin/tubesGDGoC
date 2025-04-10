import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../common/notifier.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool isPassword;
  final double borderRadius;

  const CustomTextFormField(
      {super.key,
      required this.label,
      required this.controller,
      this.textInputType = TextInputType.text,
      this.validator,
      this.isPassword = false,
      this.borderRadius = 8});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppState>(context);

    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isPassword ? provider.isPasswordNotVisible : false,
      autocorrect: !isPassword,
      enableSuggestions: !isPassword,
      style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 12),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0XFFE7E7E7),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0XFFE7E7E7),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFF5EC57E),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.redAccent,
          ),
        ),
        labelText: label,
        labelStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: Color(0XFF9B9B9B)),
        errorStyle:
            GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 10),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
        suffixIcon: isPassword
            ? IconButton(
                splashRadius: 30,
                onPressed: () {
                  provider.togglePassVisible();
                },
                icon: provider.isPasswordNotVisible
                    ? const Icon(Icons.visibility_off, color: Color(0XFF9B9B9B))
                    : const Icon(Icons.visibility, color: Color(0XFF9B9B9B)),
              )
            : null,
      ),
    );
  }
}

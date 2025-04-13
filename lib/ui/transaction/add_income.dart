import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tubes_gdgoc/common/validate.dart';

import '../../service/firebase_service.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({super.key});

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  String _selectedCategory = "Gaji";
  final _formKey = GlobalKey<FormState>();
  final _totalController = TextEditingController();
  final _dateController = TextEditingController();
  final _descController = TextEditingController();

  List<DropdownMenuItem<String>> dropdownItems = [
    DropdownMenuItem(value: "Gaji", child: Text("Gaji")),
    DropdownMenuItem(value: "Bonus", child: Text("Bonus")),
    DropdownMenuItem(value: "Hasil Investasi", child: Text("Hasil Investasi")),
    DropdownMenuItem(value: "Lainya", child: Text("Lainya")),
  ];

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now());

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('d MMM yyyy').format(picked);
      });
    }
  }

  Future<bool> _addTransaction() async {
    bool isSuccess = await FirebaseService().addTransaction(
      context,
      type: 'income',
      total: int.parse(_totalController.text),
      category: _selectedCategory,
      date: _dateController.text,
      desc: _descController.text,
    );

    return isSuccess;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Tambah Pemasukan",
              style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
          iconTheme: IconThemeData(color: Colors.black)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 8, 30, 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  Text("Nominal", style: GoogleFonts.inter()),
                  SizedBox(height: 8),
                  _textForm(
                      hint: 'Rp',
                      controller: _totalController,
                      textInputType: TextInputType.number,
                      validator: (value) =>
                          ValidatorCode().transactionValidator(value)),
                  SizedBox(height: 16),
                  Text("Kategori", style: GoogleFonts.inter()),
                  SizedBox(height: 8),
                  _dropdown(value: _selectedCategory, items: dropdownItems),
                  SizedBox(height: 16),
                  Text("Tanggal", style: GoogleFonts.inter()),
                  SizedBox(height: 8),
                  InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () async {
                        await _selectDate();
                      },
                      child: IgnorePointer(
                          child: _textForm(
                              hint: "Masukkan tanggal",
                              controller: _dateController,
                              withIcon: true,
                              validator: (value) =>
                                  ValidatorCode().emptyValidator(value)))),
                  SizedBox(height: 16),
                  Text("Deskripsi", style: GoogleFonts.inter()),
                  SizedBox(height: 8),
                  _textForm(
                      hint: "Deskripsi singkat",
                      controller: _descController,
                      maxLength: 20,
                      validator: (value) =>
                          ValidatorCode().emptyValidator(value)),
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
                        await _addTransaction().then(
                          (value) => value ? Navigator.pop(context) : null,
                        );
                      }
                    },
                    child: Text("Tambah Pemasukan"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textForm({
    required String hint,
    required TextEditingController controller,
    TextInputType textInputType = TextInputType.text,
    String? Function(String?)? validator,
    int? maxLength,
    bool withIcon = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: GoogleFonts.inter(fontSize: 12),
      maxLength: maxLength,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black45),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black45),
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
            fontWeight: FontWeight.w600, color: Colors.black26),
        prefixIcon: withIcon
            ? Icon(Icons.date_range_outlined, color: Color(0xFF5EC57E))
            : null,
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 16),
      ),
    );
  }

  Widget _dropdown(
      {required String value, required List<DropdownMenuItem<String>>? items}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        value: value,
        items: items,
        onChanged: (String? value) {
          setState(() {
            _selectedCategory = value!;
          });
        },
        hint: Text("Pilih Kategori", style: GoogleFonts.inter()),
        style: GoogleFonts.inter(color: Colors.black),
        isExpanded: true,
        menuItemStyleData: MenuItemStyleData(
            height: 50, padding: EdgeInsets.symmetric(horizontal: 16)),
        buttonStyleData: ButtonStyleData(
            padding: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black45),
                borderRadius: BorderRadius.circular(8))),
        dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0XFFECEEF2)),
                borderRadius: BorderRadius.circular(8))),
        iconStyleData: IconStyleData(
            iconDisabledColor: Colors.grey, iconEnabledColor: Colors.grey),
      ),
    );
  }
}

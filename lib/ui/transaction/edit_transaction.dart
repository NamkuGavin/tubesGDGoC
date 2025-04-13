import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tubes_gdgoc/common/list_data.dart';

import '../../common/notifier.dart';
import '../../common/validate.dart';
import '../../service/firebase_service.dart';

class EditTransaction extends StatefulWidget {
  final String type;
  final String docId;
  final String day;
  final String week;
  final num oldTotal;
  final String category;
  final String date;
  final String desc;
  const EditTransaction(
      {super.key,
      required this.type,
      required this.docId,
      required this.day,
      required this.week,
      required this.oldTotal,
      required this.category,
      required this.date,
      required this.desc});

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  final _formKey = GlobalKey<FormState>();
  final _totalController = TextEditingController();
  final _descController = TextEditingController();

  Future _selectDate(AppState provider) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now());

    if (picked != null) {
      provider.formatDateControll(picked);
    }
  }

  Future<bool> _editTransaction(AppState provider) async {
    bool isSuccess = await FirebaseService().editTransaction(context,
        type: widget.type == 'income' ? 'income' : 'spending',
        total: int.parse(_totalController.text),
        category: widget.type == 'income'
            ? provider.selectedCategoryIncome
            : provider.selectedCategorySpending,
        date: provider.dateController.text,
        desc: _descController.text,
        docId: widget.docId,
        oldTotal: widget.oldTotal,
        day: widget.day,
        week: widget.week);

    return isSuccess;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AppState>(context, listen: false);
      widget.type == 'income'
          ? provider.changeCategoryIncome(widget.category)
          : provider.changeCategorySpending(widget.category);
      provider.dateController.text = widget.date;

      _totalController.text = widget.oldTotal.toString();
      _descController.text = widget.desc;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text("Edit Transaksi",
              style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
          iconTheme: IconThemeData(color: Colors.black)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
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
                  _dropdown(
                      provider: provider,
                      value: widget.type == 'income'
                          ? provider.selectedCategoryIncome
                          : provider.selectedCategorySpending,
                      items: widget.type == 'income'
                          ? ListData.dropdownIncome
                          : ListData.dropdownSpending),
                  SizedBox(height: 16),
                  Text("Tanggal", style: GoogleFonts.inter()),
                  SizedBox(height: 8),
                  InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () async {
                        await _selectDate(provider);
                      },
                      child: IgnorePointer(
                          child: _textForm(
                              hint: "Masukkan tanggal",
                              controller: provider.dateController,
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
                        backgroundColor: Color(0xFF5EC57E),
                        foregroundColor: Colors.white,
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
                        await _editTransaction(provider).then(
                          (value) => value ? Navigator.pop(context) : null,
                        );
                      }
                    },
                    child: Text("Edit"),
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
      {required String value,
      required List<DropdownMenuItem<String>>? items,
      required AppState provider}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        value: value,
        items: items,
        onChanged: (String? value) {
          widget.type == 'income'
              ? provider.changeCategoryIncome(value)
              : provider.changeCategorySpending(value);
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

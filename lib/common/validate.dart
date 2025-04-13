class ValidatorCode {
  String? emptyValidator(value) {
    return value.toString().trim().isEmpty ? 'Field tidak boleh kosong' : null;
  }

  String? nameValidator(value) {
    bool nameValid = RegExp(r'[0-9]').hasMatch(value);

    if (nameValid) {
      return 'Nama tidak boleh ada angka';
    } else if (value.toString().trim().isEmpty) {
      return 'Nama tidak boleh kosong';
    } else {
      return null;
    }
  }

  String? emailValidator(value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return !emailValid ? 'Email tidak valid' : null;
  }

  String? passwordValidator(value) {
    return value.toString().length < 6
        ? 'Kata sandi tidak boleh kurang dari 6 karakter'
        : null;
  }

  String? transactionValidator(value) {
    if (value.toString() == '0') {
      return 'Nominal tidak boleh 0';
    } else if (value.toString().trim().isEmpty) {
      return 'Nominal tidak boleh kosong';
    } else {
      return null;
    }
  }
}

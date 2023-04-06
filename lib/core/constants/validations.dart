String? validateEmail(String? value) {
  final regex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  if (value!.isEmpty) {
    return 'Field cannot be empty';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email';
    } else {
      return null;
    }
  }
}

String? validateNotEmpty(String? value) {
  if (value!.isEmpty) {
    return 'Required Field';
  }
  return null;
}

String? validateNumber(String? value) {
  if (value!.length < 10) {
    return 'Number should be greater or equal to 10 digits';
  }
  return null;
}

String? validatePassword(String? value) {
  final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{10,}$');
  if (value!.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return '''
Your password must be at least 10 character long with atleast
1 numeric charater, 1 capital case and 1 special character each
''';
    } else {
      return null;
    }
  }
}

String? validatePassword(String? value) {
  final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{6,}$');
  if (value!.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return '''
Your password must be at least 6 character long
 with minimum 1 upper case, lowercase, special character each
''';
    } else {
      return null;
    }
  }
}

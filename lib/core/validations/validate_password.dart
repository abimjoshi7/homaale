String? validatePassword(String? value) {
  final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{6,}$');
  if (value!.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return '''
Password must contain:
Minimum 1 Upper case,
Minimum 1 lowercase,
Minimum 1 Special Character
''';
    } else {
      return null;
    }
  }
}

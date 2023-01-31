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

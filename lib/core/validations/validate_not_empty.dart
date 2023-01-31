String? validateNotEmpty(String? value) {
  if (value!.isEmpty) {
    return 'Field cannot be empty';
  }
  return null;
}

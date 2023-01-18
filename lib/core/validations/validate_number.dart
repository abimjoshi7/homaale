String? validateNumber(String? value) {
  if (value!.length < 10) {
    return 'Number should be greater or equal to 10 digits';
  }
  return null;
}

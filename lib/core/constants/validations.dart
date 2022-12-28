// regular expression to check if string
// ignore: non_constant_identifier_names
RegExp pass_valid = RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)');
//A function that validate user entered password
bool validatePassword(String pass) {
  final password = pass.trim();
  if (pass_valid.hasMatch(password)) {
    return true;
  } else {
    return false;
  }
}

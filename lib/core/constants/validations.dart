// regular expression to check if string
RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
//A function that validate user entered password
bool validatePassword(String pass) {
  String _password = pass.trim();
  if (pass_valid.hasMatch(_password)) {
    return true;
  } else {
    return false;
  }
}

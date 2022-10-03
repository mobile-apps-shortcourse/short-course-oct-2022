import 'package:shared_utils/shared_utils.dart' show TextX;

class Validators {
  /// simple input validator
  static String? validate(String? input) {
    if (input.isNullOrEmpty()) return 'required';
    return null;
  }

  static String? validatePhone(String? input) {
    input = input?.replaceAll(' ', '');
    if (input.isNullOrEmpty()) return 'Required';
    var regex = RegExp(
        r'\s*(?:\+?(\d{1,3}))?[\W\D\s]^|()*(\d[\W\D\s]*?\d[\D\W\s]*?\d)[\W\D\s]*(\d[\W\D\s]*?\d[\D\W\s]*?\d)[\W\D\s]*(\d[\W\D\s]*?\d[\D\W\s]*?\d[\W\D\s]*?\d)(?: *x(\d+))?\s*');
    return regex.hasMatch(input!.trim()) ? null : 'Invalid phone number';
  }

  static String? validateEmail(String? input) {
    if (input.isNullOrEmpty()) return 'Required';
    var regex = RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)');
    return regex.hasMatch(input!.trim()) ? null : 'Invalid email address';
  }

  static String? validatePassword(String? input) {
    if (input.isNullOrEmpty()) return 'Required';

    /// min length of 4
    var regex = RegExp(r'[A-Za-z0-9@#$%^&+=]{4,}');
    return regex.hasMatch(input!.trim())
        ? null
        : 'Invalid password or too short';
  }
}

class ValidationHelper{

  /// Email validator
  static String? validateEmail(String value) {
    final RegExp emailRegExp = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[A-Za-z0-9]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$');
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'ex: example.1234@gmail.com';
    }
    return null;
  }

  /// For Password Validation
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (value.length <8) {
      return 'Password must be 8 characters long';
    }
    return null;
  }

}
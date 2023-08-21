class Validation {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!value.contains('@')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}

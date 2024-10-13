class ValidationService {
  static bool validateEmail(String email) {
    email = email.trim();
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  static bool validatePhoneNumber(String phoneNumber) {
    return RegExp(r'^\d{10}$').hasMatch(phoneNumber);
  }
}
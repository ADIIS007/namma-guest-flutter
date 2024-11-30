import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefLogin {

  // Save login details
  static Future<void> saveLoginDetails(String email, String type) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', email);
    await prefs.setString('type', type);
  }

  // Get login details
  static Future<Map<String, String?>> getLoginDetails() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('token');
    String? type = prefs.getString('type');

    return {
      'token': email,
      'type': type
    };
  }

  // Clear login details
  static Future<void> clearLoginDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('type');
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:namma_guest/Api/api_constants.dart';
import 'package:namma_guest/Model/api_response.dart';

class ApiService {
  final String _baseUrl = ApiConstants.baseUrl;

  Future<dynamic> sendOtpRequest(String email) async {
    //Endpoint for requesting OTP
    final url = Uri.parse("$_baseUrl/auth/send-otp");

    //Body for requesting OTP
    final Map<String,dynamic> body = {
      'email': email
    };

    //Endpoint for requesting OTP
    final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json'
        },
        body: json.encode(body)
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      //Successful condition
      return ApiResponse(true,response.body);
    } else if (response.statusCode == 425) {
      //Too early condition
      return ApiResponse(false,response.body);
    } else if (response.statusCode == 400) {
      //Bad request condition
      return ApiResponse(false,response.body);
    } else if (response.statusCode == 500) {
      //Internal server condition
      return ApiResponse(false,response.body);
    } else if (response.statusCode == 404) {
      //Internal server condition
      return ApiResponse(false,response.body);
    } else {
      throw Exception('Failed to send OTP');
    }
  }
}
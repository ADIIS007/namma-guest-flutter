import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:namma_guest/Api/api_constants.dart';
import 'package:namma_guest/Model/api_response.dart';
import 'package:namma_guest/Model/paying_guest_model.dart';

import '../Service/shared_pref_login.dart';

class ApiService {
  final String _baseUrl = ApiConstants.baseUrl;

  Future<dynamic> sendOtpRequest(String email) async {
    try {
      //Endpoint for requesting OTP
      final url = Uri.parse("$_baseUrl/auth/send-otp");

      //Body for requesting OTP
      final Map<String, dynamic> body = {
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

      if (response.statusCode == 200) {
        //Successful condition
        return ApiResponse(true, response.body);
      } else if (response.statusCode == 425) {
        //Too early condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 400) {
        //Bad request condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 500) {
        //Internal server condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 404) {
        //Internal server condition
        return ApiResponse(false, response.body);
      } else {
        throw Exception('Failed to send OTP');
      }
    } catch (e) {
      return ApiResponse(false, e.toString());
    }
  }

  Future<dynamic> verifyOtpRequest(String email, String otp) async {
    try {
      //Endpoint for requesting OTP
      final url = Uri.parse("$_baseUrl/auth/verify-otp");

      //Body for requesting OTP
      final Map<String, dynamic> body = {
        'email': email,
        'otp': otp
      };

      //Endpoint for requesting OTP
      final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json'
          },
          body: json.encode(body)
      );

      if (response.statusCode == 200) {
        //Successful condition
        print("Hi Adi login saved!");
        await SharedPrefLogin.saveLoginDetails(email,response.body);
        return ApiResponse(true, response.body);
      } else if (response.statusCode == 425) {
        //Too early condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 400) {
        //Bad request condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 500) {
        //Internal server condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 404) {
        //Internal server condition
        return ApiResponse(false, response.body);
      } else {
        throw Exception('Failed to send OTP');
      }
    } catch (e) {
      return ApiResponse(false, e.toString());
    }
  }

  Future<dynamic> resendOtpRequest(String email) async{
    try {
      //Endpoint for requesting OTP
      final url = Uri.parse("$_baseUrl/auth/resend-otp");

      //Body for requesting OTP
      final Map<String, dynamic> body = {
        'email': email,
      };

      //Endpoint for requesting OTP
      final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json'
          },
          body: json.encode(body)
      );

      if (response.statusCode == 200) {
        //Successful condition
        return ApiResponse(true, response.body);
      } else if (response.statusCode == 425) {
        //Too early condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 400) {
        //Bad request condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 500) {
        //Internal server condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 404) {
        //Internal server condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 429) {
        //Internal server condition
        return ApiResponse(false, response.body);
      } else {
        throw Exception('Failed to Resend OTP');
      }
    } catch (e) {
      return ApiResponse(false, e.toString());
    }
  }

  Future<dynamic> setUserType(String email,String type) async {
    try {
      //Endpoint for requesting OTP
      final url = Uri.parse("$_baseUrl/auth/userType/$type");

      //Body for requesting OTP
      final Map<String, dynamic> body = {
        'email': email,
      };

      //Endpoint for requesting OTP
      final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json'
          },
          body: json.encode(body)
      );

      if (response.statusCode == 200) {
        //Successful condition
        return ApiResponse(true, response.body);
      } else if (response.statusCode == 425) {
        //Too early condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 400) {
        //Bad request condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 500) {
        //Internal server condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 404) {
        //Internal server condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 429) {
        //Internal server condition
        return ApiResponse(false, response.body);
      } else {
        throw Exception('Failed to Resend OTP');
      }
    } catch (e) {
      return ApiResponse(false, e.toString());
    }
  }

  // Owner specific API methods
  Future<dynamic> createPg(PayingGuest payingGuest) async {
    try {
      Map<String, String?> sharedPref = await SharedPrefLogin.getLoginDetails();
      String? email = sharedPref['token']!;
      
      //Endpoint for requesting OTP
      final url = Uri.parse("$_baseUrl/owner/hostelCreation/$email");

      //Body for requesting OTP
      payingGuest.setCountry = 'India';
      final Map<String, dynamic> body = payingGuest.toJson();

      //Endpoint for requesting OTP
      final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json'
          },
          body: json.encode(body)
      );

      if (response.statusCode == 200) {
        //Successful condition
        return ApiResponse(true, response.body);
      } else if (response.statusCode == 404) {
        //Not Found condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 400) {
        //Bad request condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 409) {
        //Conflict condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 403) {
        //forbidden conditions condition
        return ApiResponse(false, response.body);
      } else if (response.statusCode == 500) {
        //Internal server condition
        return ApiResponse(false, response.body);
      } else {
        throw Exception('Failed to Resend OTP');
      }
    } catch (e) {
      return ApiResponse(false, e.toString());
    }
  }
}
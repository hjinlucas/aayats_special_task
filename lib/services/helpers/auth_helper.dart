import 'package:aayats_mobile_app/models/request/auth/login_model.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

class AuthHelper {
  Future<Map<String, dynamic>?> login(LoginModel loginData) async {
    final url = Uri.http(Config.apiUrl, Config.loginUrl);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(loginData.toJson()),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        // Handle error response
        if (kDebugMode) {
          print("Login error: ${response.body}");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("An error occurred: $e");
      }
      return null;
    }
  }
}

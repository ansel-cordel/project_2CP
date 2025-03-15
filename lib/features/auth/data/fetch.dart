import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final loginProvider = Provider((ref) => Auth());

class Auth {
  Future<http.Response> signup({
    required String name,
    required String lastname,
    required String password,
    required String email,
    required String role,
  }) async {
    const String url = "https://curvy-icons-fix.loca.lt/api/register/";
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "username": name,
        "last_name": lastname,
        "password": password,
        "role": role,
      }),
    );
    return response;
  }
}

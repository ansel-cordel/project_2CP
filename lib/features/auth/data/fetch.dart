import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth {
  Future<http.Response> signup({
    required String username,
    required int phone_number,
    required String name,
    required String last_name,
    required String password,
    required String email,
    required String adress,
  }) async {
    const url = "https://curvy-icons-fix.loca.lt/api/register/";
    return await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "username": username,
        "name": name,
        "last_name": last_name,
        "password": password,
        "phone_number": phone_number,
        "adress": adress,
      }),
    );
  }

  Future<http.Response> login({
    required String username,
    required String password,
  }) async {
    const url = "https://curvy-icons-fix.loca.lt/api/login/";
    return await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final loginProvider = Provider((ref) => Auth());

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
    const String url = "https://curvy-icons-fix.loca.lt/api/register/";
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "username": username,
        "name":name,
        "last_name": last_name,
        "password": password,
        "phone_number":phone_number,
        "adress":adress,

      }),
    );
    return response;
  }
}

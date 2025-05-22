import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth {
  Future<Map<String, dynamic>> signupDeliverer({
  required String username,
  required int phoneNumber,
  required String name,
  required String lastName,
  required String password,
  required String email,
  
  required String workingZone,
  required String vehicleType,
}) async {
  const url = "https://loud-shrimps-marry.loca.lt/api/restaurant/singup/"; // change this URL if it's different for deliverers
  final response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "email": email,
      "username": username,
      "name": name,
      "last_name": lastName,
      "password": password,
      "phone_number": phoneNumber,
      
      "working_zone": workingZone,
      "vehicle_type": vehicleType,
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to sign up deliverer: ${response.body}');
  }
}

  Future<Map<String, dynamic>> signup({
    required String username,
    required int phoneNumber,
    required String name,
    required String lastName,
    required String password,
    required String email,
    required String address,
    // 'client', 'restaurant', or 'deliverer'
  }) async {
    const url = "https://loud-shrimps-marry.loca.lt/api/restaurant/singup/";
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "username": username,
        "name": name,
        "last_name": lastName,
        "password": password,
        "phone_number": phoneNumber,
        "address": address,
        
      }),
    );
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to sign up: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    const url = "https://giant-cups-swim.loca.lt/api/login/";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        // Print for debugging
        print("API Response: $data");
        
        // Extract role from nested user object
        String? role;
        if (data['user'] != null && data['user']['role'] != null) {
          role = data['user']['role'];
        } else {
          role = 'client'; // Default to client if role is missing
        }

        // Return data in the same format as before, but with additional profile info
        return {
          'token': data['token'],
          'role': role,
          // Add profile data but keep it optional so existing UI won't break
          'profile': data['profile'],
          'user': data['user'],
        };
      } else {
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (e) {
      print("Login error: $e");
      throw Exception('Failed to login: $e');
    }
  }
}
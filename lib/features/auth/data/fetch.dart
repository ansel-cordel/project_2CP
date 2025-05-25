import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_2cp/core/widgets/snack_bar_servide.dart';
import 'package:project_2cp/features/auth/data/token_storage.dart';
import 'package:project_2cp/features/auth/presentation/congratulations.dart';
import 'package:project_2cp/features/auth/presentation/log_in_page.dart';
import 'dart:convert';



class Auth {
  static const String baseUrl = 'http://192.168.156.107:8000/api';
Future<void> logout() async {
  final token = await TokenStorage.getToken();
  
  if (token == null) {
    print('No token found, clearing storage and redirecting...');
    await TokenStorage.clearAll();
    Get.offAll(() => LoginScreen());
    return;
  }

  try {
    print('Attempting logout with token format: Token');
    
    final response = await http.post(
      Uri.parse('$baseUrl/logout/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token $token", // Use Token format, not Bearer
      },
    );

    print('Logout response status: ${response.statusCode}');
    print('Logout response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 204) {
      print('Logout successful');
    } else {
      print("Logout failed: ${response.statusCode} -> ${response.body}");
    }
  } catch (e) {
    print("Logout API call failed: $e");
  } finally {
    // Always clear local storage and navigate
    await TokenStorage.clearAll();
    Get.offAll(() => LoginScreen());
  }
}

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
  const url = "$baseUrl/delivery/signup/"; 
  
  // Debug print to see what we're sending
  final requestBody = {
    "username": username,
    "last_name": lastName,  // Changed from "last_name" to match API
    "email": email,
    "password": password,
    "name": name,
    "phone_number": phoneNumber,
    "vehicle_type": vehicleType,  // Changed from "vehicle_type" to match API
    "working_zone": workingZone,  // Changed from "working_zone" to match API
  };
  
  print("Sending request to: $url");
  print("Request body: ${jsonEncode(requestBody)}");
  
  final response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(requestBody),
  );
  
  print("Response status code: ${response.statusCode}");
  print("Response body: ${response.body}");

  if (response.statusCode == 200 || response.statusCode == 201) {
    print("Deliverer signup successful");
    return jsonDecode(response.body);
    Get.to(LoginScreen());
    
  } else {
    print("Deliverer signup failed: ${response.body}");
    throw Exception('Failed to sign up deliverer: ${response.body}');
  }
}
  Future<Map<String, dynamic>> signup({
    required String role,
    required String username,
    required int phoneNumber,
    required String name,
    required String lastName,
    required String password,
    required String email,
    required String address,
  
  }) async {
    
   late final String url;

  
  if (role == "Client") {
    url = '$baseUrl/client/signup/';
  } else if (role == "Restaurant") {
    url = '$baseUrl/restaurant/signup/';
  } else if (role == "Deliverer") {
    url = '$baseUrl/delivery/signup/';
  } else {
    throw Exception('Invalid role: $role');
  }
    print(url);
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
    const url = '$baseUrl/login/';
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
        
        
        print("API Response: $data");
        
        
        String? role;
        if (data['user'] != null && data['user']['role'] != null) {
          role = data['user']['role'];
        } else {
          role = 'client'; 
        }

    
        return {
          'token': data['token'],
          'role': role,
          
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
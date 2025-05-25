import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_2cp/features/auth/data/token_storage.dart';
import 'package:project_2cp/features/client/orderhisyory/data/ordermodel.dart';


class OrderHistoryService {
  static const String baseUrl = 'http://192.168.156.107:8000/api'; // Replace with your actual API URL
  
  Future<List<OrderHistory>> fetchOrderHistory() async {
     final token = await TokenStorage.getToken();
  
  if (token == null) {
    print('No token found, clearing storage and redirecting...');
  }

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/orders/client/history/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token' // Add your auth token here
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => OrderHistory.fromJson(json)).toList();
      } else if (response.statusCode == 403) {
        throw Exception('Access denied. Only clients can view order history.');
      } else if (response.statusCode == 404) {
        throw Exception('Client profile not found.');
      } else {
        throw Exception('Failed to fetch order history: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OrderService {
  final _storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  Future<Map<String, dynamic>> placeOrder({
    required int clientId,
    required int restaurantId,
    required List<Map<String, dynamic>> items,
    required double totalPrice,
  }) async {
    final token = await getToken();

    if (token == null) {
      throw Exception("User not authenticated");
    }

    final url = Uri.parse("http://<your-server-ip>:8000/api/orders");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "client_id": clientId,
        "restaurant_id": restaurantId,
        "items": items,
        "total_price": totalPrice,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to place order: ${response.body}");
    }
  }
}

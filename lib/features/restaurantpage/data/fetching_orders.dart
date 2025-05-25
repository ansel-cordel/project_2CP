import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_2cp/features/auth/data/token_storage.dart';
import 'package:project_2cp/features/restaurantpage/data/fetching_orders_models.dart';

class OrderApiService {
  final String baseUrl;

  OrderApiService(this.baseUrl);

  Future<List<RestaurantOrder>> fetchRestaurantOrders() async {
    try {
      final token = await TokenStorage.getToken();
      if (token == null) {
        throw Exception('No authentication token found');
      }

      print('Making request to: $baseUrl/orders/restaurant/'); // Debug
      print('Using token: ${token.substring(0, 10)}...'); // Debug (partial token)

      final response = await http.get(
        Uri.parse('$baseUrl/orders/restaurant/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token $token",
        },
      );

      print('Response status: ${response.statusCode}'); // Debug
      print('Response body: ${response.body}'); // Debug

      if (response.statusCode == 200) {
        final dynamic responseData = jsonDecode(response.body);
        
        // Handle both array and object responses
        List<dynamic> data;
        if (responseData is List) {
          data = responseData;
        } else if (responseData is Map && responseData.containsKey('results')) {
          // Handle paginated response
          data = responseData['results'] as List;
        } else if (responseData is Map && responseData.containsKey('orders')) {
          // Handle wrapped response
          data = responseData['orders'] as List;
        } else {
          throw Exception('Unexpected response format: $responseData');
        }

        print('Parsed ${data.length} orders from response'); // Debug
        
        return data.map((json) => RestaurantOrder.fromJson(json as Map<String, dynamic>)).toList();
      } else if (response.statusCode == 401) {
        throw Exception('Authentication failed. Please login again.');
      } else if (response.statusCode == 403) {
        throw Exception('Access denied. Restaurant not authorized.');
      } else if (response.statusCode == 404) {
        throw Exception('Orders endpoint not found. Check API URL.');
      } else {
        throw Exception('Failed to load orders (${response.statusCode}): ${response.body}');
      }
    } catch (e) {
      print('Error in fetchRestaurantOrders: $e'); // Debug
      rethrow;
    }
  }
    Future<MarkOrderReadyResponse> markOrderReady(int orderId) async {
    try {
      final token = await TokenStorage.getToken();
      if (token == null) {
        throw Exception('No authentication token found');
      }

      print('Marking order $orderId as ready...'); // Debug
      
      final response = await http.post(
        Uri.parse('$baseUrl/orders/$orderId/mark-ready/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token $token",
        },
      );

      print('Mark ready response status: ${response.statusCode}'); // Debug
      print('Mark ready response body: ${response.body}'); // Debug

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return MarkOrderReadyResponse.fromJson(responseData);
      } else if (response.statusCode == 400) {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['error'] ?? 'Only confirmed orders can be marked as ready');
      } else if (response.statusCode == 404) {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['error'] ?? 'Order not found or not associated with your restaurant');
      } else if (response.statusCode == 401) {
        throw Exception('Authentication failed. Please login again.');
      } else {
        throw Exception('Failed to mark order as ready (${response.statusCode}): ${response.body}');
      }
    } catch (e) {
      print('Error in markOrderReady: $e'); // Debug
      rethrow;
    }
  }
}
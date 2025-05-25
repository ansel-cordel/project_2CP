import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_2cp/features/auth/data/token_storage.dart';

import 'package:project_2cp/features/delivrer/OrdersScreen/data/models.dart';

class DeliveryApiService {
  final String baseUrl;

  DeliveryApiService(this.baseUrl);

  Future<List<DeliveryOrder>> fetchReadyOrdersForDelivery() async {
    try {
      final token = await TokenStorage.getToken();
      if (token == null) {
        throw Exception('No authentication token found');
      }

      print('Making request to: $baseUrl/orders/delivery/'); // Debug
      print('Using token: ${token.substring(0, 10)}...'); // Debug (partial token)

      final response = await http.get(
        Uri.parse('$baseUrl/orders/delivery/'),
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

        print('Parsed ${data.length} ready orders from response'); // Debug
        
        return data.map((json) => DeliveryOrder.fromJson(json as Map<String, dynamic>)).toList();
      } else if (response.statusCode == 401) {
        throw Exception('Authentication failed. Please login again.');
      } else if (response.statusCode == 403) {
        throw Exception('Access denied. Only delivery personnel can view ready orders.');
      } else if (response.statusCode == 404) {
        throw Exception('Delivery orders endpoint not found. Check API URL.');
      } else {
        throw Exception('Failed to load ready orders (${response.statusCode}): ${response.body}');
      }
    } catch (e) {
      print('Error in fetchReadyOrdersForDelivery: $e'); // Debug
      rethrow;
    }
  }
  Future<List<DeliveryOrder>> fetchHistoryOrdersForDelivery() async {
    try {
      final token = await TokenStorage.getToken();
      if (token == null) {
        throw Exception('No authentication token found');
      }

      print('Making request to: $baseUrl/orders/delivery/history/'); // Debug
      print('Using token: ${token.substring(0, 10)}...'); // Debug (partial token)

      final response = await http.get(
        Uri.parse('$baseUrl/orders/delivery/history/'),
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

        print('Parsed ${data.length} ready orders from response'); // Debug
        
        return data.map((json) => DeliveryOrder.fromJson(json as Map<String, dynamic>)).toList();
      } else if (response.statusCode == 401) {
        throw Exception('Authentication failed. Please login again.');
      } else if (response.statusCode == 403) {
        throw Exception('Access denied. Only delivery personnel can view ready orders.');
      } else if (response.statusCode == 404) {
        throw Exception('Delivery orders endpoint not found. Check API URL.');
      } else {
        throw Exception('Failed to load ready orders (${response.statusCode}): ${response.body}');
      }
    } catch (e) {
      print('Error in fetchReadyOrdersForDelivery: $e'); // Debug
      rethrow;
    }
  }

  Future<PickupOrderResponse> pickupOrder(int orderId) async {
    try {
      final token = await TokenStorage.getToken();
      if (token == null) {
        throw Exception('No authentication token found');
      }

      print('Picking up order $orderId...'); // Debug
      
      final response = await http.post(
        Uri.parse('$baseUrl/orders/$orderId/pickup/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token $token",
        },
      );

      print('Pickup response status: ${response.statusCode}'); // Debug
      print('Pickup response body: ${response.body}'); // Debug

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return PickupOrderResponse.fromJson(responseData);
      } else if (response.statusCode == 400) {
        final errorData = jsonDecode(response.body);
        String errorMessage = errorData['error'] ?? 'Bad request';
        if (errorMessage.contains('ready orders')) {
          throw Exception('Only ready orders can be picked up');
        } else if (errorMessage.contains('already been assigned')) {
          throw Exception('This order has already been assigned to another delivery person');
        } else {
          throw Exception(errorMessage);
        }
      } else if (response.statusCode == 404) {
        final errorData = jsonDecode(response.body);
        String errorMessage = errorData['error'] ?? 'Not found';
        if (errorMessage.contains('Order not found')) {
          throw Exception('Order not found');
        } else if (errorMessage.contains('Delivery profile not found')) {
          throw Exception('Delivery profile not found. Please contact support.');
        } else {
          throw Exception(errorMessage);
        }
      } else if (response.statusCode == 401) {
        throw Exception('Authentication failed. Please login again.');
      } else if (response.statusCode == 403) {
        throw Exception('Access denied. Only delivery personnel can pick up orders.');
      } else {
        throw Exception('Failed to pickup order (${response.statusCode}): ${response.body}');
      }
    } catch (e) {
      print('Error in pickupOrder: $e'); // Debug
      rethrow;
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_2cp/features/auth/data/token_storage.dart';
import 'package:project_2cp/features/client/home/data/restaurant_model.dart';
import 'package:project_2cp/features/client/orderlist/data/Item_mdeol.dart';

class ApiService {
  static const String baseUrl = 'hhttps://tough-glasses-itch.loca.lt/api';

   // ✅ [1] Confirm that the client has received the order
  static Future<void> confirmOrderReceived(int orderId) async {
    final token = await TokenStorage.getToken();

    if (token == null) throw Exception('No token found');

    final response = await http.put(
      Uri.parse('$baseUrl/orders/$orderId/received/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to confirm order receipt. Status: ${response.statusCode}');
    }
  }

  // ✅ [2] Get all orders placed by the client (order history)
  static Future<List<Item>> fetchClientOrders() async {
    final token = await TokenStorage.getToken();

    if (token == null) throw Exception('No token found');

    final response = await http.get(
      Uri.parse('$baseUrl/client/orders/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((order) => Item.fromJson(order)).toList();
    } else {
      throw Exception('Failed to fetch client orders. Status: ${response.statusCode}');
    }
  }

  static Future<void> confirmOrder(int orderId) async {
  final token = await TokenStorage.getToken();

  if (token == null) throw Exception('No token found');

  final response = await http.put(
    Uri.parse('$baseUrl/orders/$orderId/confirm/'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to confirm order. Status: ${response.statusCode}');
  }
}


 static Future<List<Restaurant>> fetchRestaurants() async {
  final token = await TokenStorage.getToken();

  if (token == null) throw Exception('No token found');

  final response = await http.get(
    Uri.parse('$baseUrl/api/restaurants/'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    return data.map((restaurantJson) => Restaurant.fromJson(restaurantJson)).toList();
  } else {
    throw Exception('Failed to load restaurants: ${response.statusCode}');
  }
}


  static Future<Item> fetchPopularItem() async {
  final token = await TokenStorage.getToken();

  if (token == null) throw Exception('No token found');

  final response = await http.get(
    Uri.parse('$baseUrl/items/popular/'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return Item.fromJson(data);
  } else {
    throw Exception('Failed to load popular item');
  }
}


  static Future<List<Item>> fetchItems() async {
    final token = await TokenStorage.getToken();

    if (token == null) {
      throw Exception('No token found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/items/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items. Status: ${response.statusCode}');
    }
  }
}

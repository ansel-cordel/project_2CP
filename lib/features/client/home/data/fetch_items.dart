import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_2cp/features/auth/data/token_storage.dart';
import 'package:project_2cp/features/client/home/data/restaurant_model.dart';
import 'package:project_2cp/features/client/orderlist/data/ordermodel.dart';

class ApiService {
  static const String baseUrl = 'https://curvy-icons-fix.loca.lt/api';

  static Future<List<Restaurant>> fetchRestaurants() async {
  final token = await TokenStorage.getToken();

  if (token == null) throw Exception('No token found');

  final response = await http.get(
    Uri.parse('$baseUrl/restaurants/'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    return data.map((r) => Restaurant.fromJson(r)).toList();
  } else {
    throw Exception('Failed to load restaurants');
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

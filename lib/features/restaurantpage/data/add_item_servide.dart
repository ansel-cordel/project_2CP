/*import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:project_2cp/features/restaurantpage/data/itemmodel.dart';

class MenuItemService {
  final String baseUrl = 'http://127.0.0.1:8000/api';

  // Fetch menu items
  Future<List<MenuItem>> fetchMenuItems() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => MenuItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load menu items');
    }
  }

  // Fetch restaurant orders
  Future<List<MenuItem>> fetchOrders() async {
    final ordersUrl = 'http://localhost:8000/api/restaurant/123/orders/';

    final response = await http.get(Uri.parse(ordersUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => MenuItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  // Add new menu item
  Future<void> addMenuItem({
    required String name,
    required String description,
    required double price,
    required File image,
  }) async {
    final request = http.MultipartRequest('POST', Uri.parse(baseUrl));
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['price'] = price.toString();

    request.files.add(await http.MultipartFile.fromPath(
      'image',
      image.path,
      filename: basename(image.path),
    ));

    final response = await request.send();
    if (response.statusCode != 201) {
      throw Exception('Failed to add menu item');
    }
  }

  // Confirm order (by restaurant)
  Future<void> confirmOrder(int orderId) async {
    final response = await http.put(
      Uri.parse('http://localhost:8000/api/restaurant/orders/$orderId/confirm'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to confirm order');
    }
  }

  // Change order status (e.g., "accepted_by_restaurant", "declined")
  Future<void> changeOrderStatus(int orderId, String status) async {
    final url = Uri.parse('http://localhost:8000/api/orders/$orderId/status/');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'status': status}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update order status');
    }
  }
}
*/
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_2cp/features/delivrer/data/ordermodel.dart';

class DelivererService {
  final String baseUrl = 'http://192.168.156.107:8000/api/deliverer/orders/';

  // Fetch orders the deliverer can take
  Future<List<order>> fetchAvailableOrders() async {
    final response = await http.get(Uri.parse('$baseUrl/available/'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load available orders');
    }
  }

  // Confirm (take) an order
  Future<void> confirmOrder(int orderId) async {
    final url = Uri.parse('$baseUrl$orderId/confirm');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to confirm order');
    }
  }

  // Change order status (e.g., "delivering", "delivered")
  Future<void> changeOrderStatus(int orderId, String status) async {
    final url = Uri.parse('http://192.168.156.107:8000/api/orders/$orderId/status/');
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

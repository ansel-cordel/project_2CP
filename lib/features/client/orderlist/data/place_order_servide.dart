import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:web_socket_channel/io.dart';

class OrderService {
  final _storage = const FlutterSecureStorage();
  final String _baseUrl = "http://192.168.156.107:8000/api";

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

    final url = Uri.parse("$_baseUrl/orders");

    // Step 1: Place the initial order
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

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Failed to place order: ${response.body}");
    }

    final orderData = jsonDecode(response.body);
    final orderId = orderData['id'];

    // Step 2: Poll for order acceptance
    return await _waitForOrderAcceptance(orderId: orderId, token: token);
  }

  Future<Map<String, dynamic>> _waitForOrderAcceptance({
    required int orderId,
    required String token,
    int maxAttempts = 30, // 30 attempts
    int intervalSeconds = 5, // every 5 seconds
  }) async {
    int attempts = 0;
    final orderStatusUrl = Uri.parse("$_baseUrl/orders/$orderId/status");

    while (attempts < maxAttempts) {
      await Future.delayed(Duration(seconds: intervalSeconds));

      final statusResponse = await http.get(
        orderStatusUrl,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (statusResponse.statusCode == 200) {
        final statusData = jsonDecode(statusResponse.body);

        // Check if both restaurant and deliverer have accepted
        if (statusData['restaurant_accepted'] == true &&
            statusData['deliverer_accepted'] == true) {
          return statusData; // Both accepted
        }

        // Optional: You might want to handle partial acceptance differently
      }

      attempts++;
    }

    throw TimeoutException("Order acceptance timed out");
  }
}
  /*Future<Map<String, dynamic>> _waitForOrderAcceptance({
  required int orderId,
  required String token,
}) async {
  final channel = IOWebSocketChannel.connect(
    Uri.parse('ws://<your-server-ip>/ws/orders/$orderId'),
    headers: {'Authorization': 'Bearer $token'},
  );

  final completer = Completer<Map<String, dynamic>>();

  channel.stream.listen((message) {
    final data = jsonDecode(message);
    if (data['restaurant_accepted'] && data['deliverer_accepted']) {
      completer.complete(data);
      channel.sink.close();
    }
  });

  return completer.future.timeout(
    const Duration(minutes: 5),
    onTimeout: () {
      channel.sink.close();
      throw TimeoutException("Order acceptance timed out");
    },
  );
}
}*/
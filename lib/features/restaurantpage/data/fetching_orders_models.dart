
class OrderItem {
  final int quantity;
  final double price;
  final String itemName;

  OrderItem({
    required this.quantity,
    required this.price,
    required this.itemName,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    try {
      return OrderItem(
        quantity: json['quantity'] ?? 0,
        price: double.tryParse(json['price'].toString()) ?? 0.0,
        itemName: json['item']?['name'] ?? 'Unknown Item',
      );
    } catch (e) {
      print('Error parsing OrderItem: $e');
      print('JSON data: $json');
      rethrow;
    }
  }
}

class ClientInfo {
  final String name;
  final String phoneNumber;

  ClientInfo({
    required this.name,
    required this.phoneNumber,
  });

  factory ClientInfo.fromJson(Map<String, dynamic> json) {
    try {
      return ClientInfo(
        name: json['name'] ?? 'Unknown Client',
        phoneNumber: json['phone_number'] ?? 'No Phone',
      );
    } catch (e) {
      print('Error parsing ClientInfo: $e');
      print('JSON data: $json');
      rethrow;
    }
  }
}

class RestaurantOrder {
  final int orderId;
  final ClientInfo client;
  final List<OrderItem> items;
  final double totalPrice;

  RestaurantOrder({
    required this.orderId,
    required this.client,
    required this.items,
    required this.totalPrice,
  });

  factory RestaurantOrder.fromJson(Map<String, dynamic> json) {
    try {
      print('Parsing order JSON: $json'); // Debug print
      
      var itemsJson = json['items'] as List? ?? [];
      List<OrderItem> itemsList = itemsJson
          .map((item) => OrderItem.fromJson(item as Map<String, dynamic>))
          .toList();

      return RestaurantOrder(
        orderId: json['order_id'] ?? 0,
        client: ClientInfo.fromJson(json['client'] as Map<String, dynamic>? ?? {}),
        items: itemsList,
        totalPrice: double.tryParse(json['total_price'].toString()) ?? 0.0,
      );
    } catch (e) {
      print('Error parsing RestaurantOrder: $e');
      print('JSON data: $json');
      rethrow;
    }
  }
}
class MarkOrderReadyResponse {
  final String message;

  MarkOrderReadyResponse({required this.message});

  factory MarkOrderReadyResponse.fromJson(Map<String, dynamic> json) {
    return MarkOrderReadyResponse(
      message: json['message'] ?? 'Order marked as ready',
    );
  }
}


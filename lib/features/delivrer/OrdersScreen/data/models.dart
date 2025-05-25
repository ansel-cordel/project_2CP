class DeliveryOrderItem {
  final int quantity;
  final double price;
  final String itemName;

  DeliveryOrderItem({
    required this.quantity,
    required this.price,
    required this.itemName,
  });

  factory DeliveryOrderItem.fromJson(Map<String, dynamic> json) {
    try {
      return DeliveryOrderItem(
        quantity: json['quantity'] ?? 0,
        price: double.tryParse(json['price'].toString()) ?? 0.0,
        itemName: json['item']?['name'] ?? 'Unknown Item',
      );
    } catch (e) {
      print('Error parsing DeliveryOrderItem: $e');
      print('JSON data: $json');
      rethrow;
    }
  }
}

class DeliveryClientInfo {
  final String name;
  final String phoneNumber;
  final String address;

  DeliveryClientInfo({
    required this.name,
    required this.phoneNumber,
    required this.address,
  });

  factory DeliveryClientInfo.fromJson(Map<String, dynamic> json) {
    try {
      return DeliveryClientInfo(
        name: json['name'] ?? 'Unknown Client',
        phoneNumber: json['phone_number'] ?? 'No Phone',
        address: json['address'] ?? 'No Address',
      );
    } catch (e) {
      print('Error parsing DeliveryClientInfo: $e');
      print('JSON data: $json');
      rethrow;
    }
  }
}

class RestaurantInfo {
  final String name;
  final String address;
  final String phoneNumber;

  RestaurantInfo({
    required this.name,
    required this.address,
    required this.phoneNumber,
  });

  factory RestaurantInfo.fromJson(Map<String, dynamic> json) {
    try {
      return RestaurantInfo(
        name: json['name'] ?? 'Unknown Restaurant',
        address: json['address'] ?? 'No Address',
        phoneNumber: json['phone_number'] ?? 'No Phone',
      );
    } catch (e) {
      print('Error parsing RestaurantInfo: $e');
      print('JSON data: $json');
      rethrow;
    }
  }
}

class DeliveryOrder {
  final int orderId;
  final DeliveryClientInfo client;
  final RestaurantInfo restaurant;
  final List<DeliveryOrderItem> items;
  final double totalPrice;
  final String status;
  final DateTime createdAt;

  DeliveryOrder({
    required this.orderId,
    required this.client,
    required this.restaurant,
    required this.items,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
  });

  factory DeliveryOrder.fromJson(Map<String, dynamic> json) {
    try {
      print('Parsing delivery order JSON: $json'); // Debug print
      
      var itemsJson = json['items'] as List? ?? [];
      List<DeliveryOrderItem> itemsList = itemsJson
          .map((item) => DeliveryOrderItem.fromJson(item as Map<String, dynamic>))
          .toList();

      return DeliveryOrder(
        orderId: json['order_id'] ?? 0,
        client: DeliveryClientInfo.fromJson(json['client'] as Map<String, dynamic>? ?? {}),
        restaurant: RestaurantInfo.fromJson(json['restaurant'] as Map<String, dynamic>? ?? {}),
        items: itemsList,
        totalPrice: double.tryParse(json['total_price'].toString()) ?? 0.0,
        status: json['status'] ?? 'unknown',
        createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      );
    } catch (e) {
      print('Error parsing DeliveryOrder: $e');
      print('JSON data: $json');
      rethrow;
    }
  }
}

class PickupOrderResponse {
  final String message;

  PickupOrderResponse({required this.message});

  factory PickupOrderResponse.fromJson(Map<String, dynamic> json) {
    return PickupOrderResponse(
      message: json['message'] ?? 'Order picked up successfully',
    );
  }
}
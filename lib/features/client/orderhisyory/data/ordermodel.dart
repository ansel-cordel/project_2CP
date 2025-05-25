class OrderHistory {
  final int orderId;
  final String status;
  final double totalPrice;
  final DateTime createdAt;

  OrderHistory({
    required this.orderId,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
  });

  factory OrderHistory.fromJson(Map<String, dynamic> json) {
    return OrderHistory(
      orderId: json['order_id'] ?? 0,
      status: json['status'] ?? '',
      totalPrice: double.tryParse(json['total_price'].toString()) ?? 0.0,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'status': status,
      'total_price': totalPrice,
      'created_at': createdAt.toIso8601String(),
    };
  }

  // Helper method to get formatted status
  String get formattedStatus {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return 'Confirmed';
      case 'ready':
        return 'Ready for Pickup';
      case 'delivered':
        return 'Delivered';
      default:
        return status;
    }
  }

  // Helper method to get formatted price
  String get formattedPrice {
    return '\$${totalPrice.toStringAsFixed(2)}';
  }

  // Helper method to get formatted date
  String get formattedDate {
    return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
  }

  @override
  String toString() {
    return 'OrderHistory(orderId: $orderId, status: $status, totalPrice: $totalPrice, createdAt: $createdAt)';
  }
}
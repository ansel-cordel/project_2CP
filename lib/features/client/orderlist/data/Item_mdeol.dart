class Item {
  final String restaurantid;
  final String description;
  final String id;
  final String name;
  final String? image; // Can be null from API
  final double price; // Changed from int to double to handle "200.00"
  final bool isAvailable; // Added missing field from API
  int quantity;
  
  // These fields don't exist in API but might be needed for your app logic
  final String resto;
  final String resto_id;

  Item({
    required this.restaurantid,
    required this.description,
    required this.id,
    required this.name,
    required this.price,
    required this.isAvailable,
    this.image,
    this.resto = "", // Default empty since not in API
    this.resto_id = "1", // Default value since not in API
    this.quantity = 1,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      restaurantid: json["restaurant_id"] ?? "",
      id: json['id'].toString(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0, // Handle string to double conversion
      image: json['image'], // Can be null
      isAvailable: json['is_available'] ?? true,
      quantity: json['quantity'] ?? 1,
      resto: json['resto'] ?? "", // Default since not in API
      resto_id: json['resto_id']?.toString() ?? "1", // Default since not in API
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price.toString(),
      'description': description,
      'image': image,
      'is_available': isAvailable,
      'resto': resto,
      'quantity': quantity,
      'resto_id': resto_id,
    };
  }
}
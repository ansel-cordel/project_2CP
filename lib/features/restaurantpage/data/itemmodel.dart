
// Updated MenuItem model to match the new API response
class MenuItem {
  final int id;
  final String name;
  final String description;
  final String price;
  final String? image;
  final bool isAvailable;

  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.image,
    required this.isAvailable,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      isAvailable: json['is_available'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'is_available': isAvailable,
    };
  }
}

// Restaurant info model for the response
class RestaurantInfo {
  final int id;
  final String name;
  final String address;
  final String phone;

  RestaurantInfo({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
  });

  factory RestaurantInfo.fromJson(Map<String, dynamic> json) {
    return RestaurantInfo(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
    );
  }
}

// Combined response model
class RestaurantMenuResponse {
  final RestaurantInfo restaurantInfo;
  final List<MenuItem> menuItems;

  RestaurantMenuResponse({
    required this.restaurantInfo,
    required this.menuItems,
  });

  factory RestaurantMenuResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantMenuResponse(
      restaurantInfo: RestaurantInfo.fromJson(json['restaurant_info']),
      menuItems: (json['menu_items'] as List)
          .map((item) => MenuItem.fromJson(item))
          .toList(),
    );
  }
}
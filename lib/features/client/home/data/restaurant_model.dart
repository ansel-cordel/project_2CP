import 'package:project_2cp/features/client/orderlist/data/Item_mdeol.dart';

class User {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String role;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      role: json['role'],
    );
  }
}

class MenuList {
  final int id;
  final String name;
  final List<Item> items;

  MenuList({
    required this.id,
    required this.name,
    required this.items,
  });

  factory MenuList.fromJson(Map<String, dynamic> json) {
    return MenuList(
      id: json['id'],
      name: json['name'],
      items: (json['items'] as List? ?? [])
          .map((itemJson) => Item.fromJson(itemJson))
          .toList(),
    );
  }
}

class Restaurant {
  final int restaurantId;
  final User user;
  final String name;
  final String address;
  final String phoneNumber;
  final String email;
  final bool isAvailable;
  final MenuList? menuList;

  Restaurant({
    required this.restaurantId,
    required this.user,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.isAvailable,
    this.menuList,
  });

  // Convenience getters for backward compatibility
  

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      restaurantId: json['restaurant_id'], //here is the restaurant id 
      user: User.fromJson(json['user']),
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phone_number'],
      email: json['email'],  
      isAvailable: json['is_available'],
      menuList: json['menu_list'] != null 
          ? MenuList.fromJson(json['menu_list']) 
          : null,
    );
  }
  String get id => restaurantId.toString();
  List<Item> get items => menuList?.items ?? [];
  String get number => phoneNumber;
}
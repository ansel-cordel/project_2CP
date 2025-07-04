import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:project_2cp/features/auth/data/token_storage.dart';
import 'package:project_2cp/features/restaurantpage/data/itemmodel.dart';
import 'package:project_2cp/features/restaurantpage/providers/fetch_menu_items_fr.dart';

class MenuService {
  static const String baseUrl = "http://192.168.156.107:8000/api";

  // Method 1: Fetch menu items only (returns just the menu items list)
  Future<List<MenuItem>> fetchMenuItems() async {
    try {
      // Get the restaurant ID from stored user data
      final user = await TokenStorage.getProfile();
      if (user == null) {
        throw Exception('User not logged in');
      }

      final restaurantId = user['restaurant_id'].toString();
      if (restaurantId == null) {
        print("I AM HERE");
        print("I AM HERE");
        print("I AM HERE");
        print("I AM HERE");
        throw Exception('Restaurant ID not found in user data');
      }
       print("RESTAURANT ID");
    print(restaurantId);
      // Get the auth token
      final token = await TokenStorage.getToken();
      if (token == null) {
        throw Exception('Authentication token not found');
      }

      // Make the API call
      final response = await http.get(
        Uri.parse('$baseUrl/restaurants/$restaurantId/menu/'),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List menuItemsJson = data['menu_items'] ?? [];
        print("THIS IS THE MENU ITEMS");
        print(menuItemsJson);
        return menuItemsJson.map((json) => MenuItem.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load menu items: ${response.body}');
      }
    } catch (e) {
      print('Error fetching menu items: $e');
      throw Exception('Failed to load menu items: $e');
    }
  }

  // Method 2: Add new menu item
  Future<void> addMenuItem({
  required String name,
  required String description,
  required double price,
  File? image, // Optional image
  bool isAvailable = true,
  WidgetRef? ref,
}) async {
  try {
    // Get the auth token
    final token = await TokenStorage.getToken();
    if (token == null) {
      throw Exception('Authentication token not found');
    }

    if (image != null) {
      // If image is provided, use multipart/form-data
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/menu/item/add/'),
      );

      request.headers.addAll({
        'Authorization': 'Token $token',
      });

      request.fields['name'] = name;
      request.fields['description'] = description;
      request.fields['price'] = price.toString();
      request.fields['is_available'] = isAvailable.toString();

      request.files.add(await http.MultipartFile.fromPath(
        'image',
        image.path,
        filename: path.basename(image.path),
      ));

      final response = await request.send();

      if (response.statusCode != 201 && response.statusCode != 200) {
        final responseBody = await response.stream.bytesToString();
        throw Exception(
            'Failed to add menu item: Status ${response.statusCode}, Body: $responseBody');
      }
    } else {
      // No image: use JSON body
      final response = await http.post(
        Uri.parse('$baseUrl/menu/item/add/'),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'description': description,
          'price': price.toString(),
          'is_available': isAvailable,
        }),
      );
     if(response.statusCode == 200){
      final menuitems = ref?.watch(menuItemsProvider);
     }

      if (response.statusCode != 201 && response.statusCode != 200) {
        throw Exception('Failed to add menu item: ${response.body}');
      }
    }
    

    print('Menu item added successfully');
  } catch (e) {
    print('Error adding menu item: $e');
    throw Exception('Failed to add menu item: $e');
  }
}

  // Method 3: Update menu item
  Future<void> updateMenuItem({
    required int itemId,
    required String name,
    required String description,
    required double price,
    bool isAvailable = true,
    File? image, // Optional for updates
  }) async {
    try {
      // Get the auth token
      final token = await TokenStorage.getToken();
      if (token == null) {
        throw Exception('Authentication token not found');
      }

      if (image != null) {
        // If image is provided, use multipart request
        final request = http.MultipartRequest(
          'PUT',
          Uri.parse('$baseUrl/menu/item/$itemId/update/'),
        );

        // Add headers
        request.headers.addAll({
          'Authorization': 'Token $token',
        });

        // Add fields
        request.fields['name'] = name;
        request.fields['description'] = description;
        request.fields['price'] = price.toString();
        request.fields['is_available'] = isAvailable.toString();

        // Add image file
        request.files.add(await http.MultipartFile.fromPath(
          'image',
          image.path,
          filename: path.basename(image.path),
        ));

        final response = await request.send();

        if (response.statusCode != 200) {
          final responseBody = await response.stream.bytesToString();
          throw Exception(
              'Failed to update menu item: Status ${response.statusCode}, Body: $responseBody');
        }
      } else {
        // If no image, use regular JSON request
        final response = await http.put(
          Uri.parse('$baseUrl/menu/item/$itemId/update/'),
          headers: {
            'Authorization': 'Token $token',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'name': name,
            'description': description,
            'price': price.toString(),
            'is_available': isAvailable,
          }),
        );

        if (response.statusCode != 200) {
          throw Exception('Failed to update menu item: ${response.body}');
        }
      }
    } catch (e) {
      print('Error updating menu item: $e');
      throw Exception('Failed to update menu item: $e');
    }
  }

  // Method 4: Delete menu item (if your API supports it)
  Future<void> deleteMenuItem(int itemId) async {
    try {
      // Get the auth token
      final token = await TokenStorage.getToken();
      if (token == null) {
        throw Exception('Authentication token not found');
      }

      final response = await http.delete(
        Uri.parse('$baseUrl/menu/item/$itemId/delete/'),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to delete menu item: ${response.body}');
      }
    } catch (e) {
      print('Error deleting menu item: $e');
      throw Exception('Failed to delete menu item: $e');
    }
  }

  // Method 5: Toggle menu item availability
  Future<void> toggleItemAvailability(int itemId, bool isAvailable) async {
    try {
      // Get the auth token
      final token = await TokenStorage.getToken();
      if (token == null) {
        throw Exception('Authentication token not found');
      }

      final response = await http.put(
        Uri.parse('$baseUrl/menu/item/update/$itemId/'),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'is_available': isAvailable,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to toggle item availability: ${response.body}');
      }
    } catch (e) {
      print('Error toggling item availability: $e');
      throw Exception('Failed to toggle item availability: $e');
    }
  }
}

// Updated providers file (fetch_menu_items_fr.dart)


// Your ItemPage doesn't need to change much - just update the service call
// Update the _submit method in your ItemPage like this:

/*
Future<void> _submit() async {
  if (!_formKey.currentState!.validate()) {
    return;
  }

  if (selectedImage == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please select an image')),
    );
    return;
  }

  final String name = itemNameController.text.trim();
  final String description = itemDescriptionController.text.trim();
  final double? price = double.tryParse(priceController.text.trim());

  if (price == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enter a valid price')),
    );
    return;
  }

  try {
    final service = ref.read(menuServiceProvider);
    await service.addMenuItem(
      name: name,
      description: description,
      price: price,
      image: selectedImage!,
    );

    // Clear inputs after adding
    itemNameController.clear();
    itemDescriptionController.clear();
    priceController.clear();
    setState(() {
      selectedImage = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item added successfully!')),
    );

    Navigator.pop(context, true); // Success
  } catch (e) {
    print(e);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Failed to add item"),
    ));
  }
}
*/
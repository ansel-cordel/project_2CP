import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/restaurantpage/data/fetch_menu_items.dart';
import 'package:project_2cp/features/restaurantpage/data/itemmodel.dart';

final menuServiceProvider = Provider((ref) => MenuService());

// Provider for menu items (automatically uses current user's restaurant ID)
final menuItemsProvider = FutureProvider<List<MenuItem>>((ref) async {
  final menuService = ref.read(menuServiceProvider);
  return await menuService.fetchMenuItems();
});

// Provider for adding menu items
final addMenuItemProvider = Provider((ref) {
  return ({
    required String name,
    required String description,
    required double price,
     File? image,
    bool isAvailable = true,
  }) async {
    final menuService = ref.read(menuServiceProvider);
    await menuService.addMenuItem(
      name: name,
      description: description,
      price: price,
      image: image,
      isAvailable: isAvailable,
    );
    // Refresh the menu items list after adding
    ref.invalidate(menuItemsProvider);
  };
});

// Provider for updating menu items
final updateMenuItemProvider = Provider((ref) {
  return ({
    required int itemId,
    required String name,
    required String description,
    required double price,
    bool isAvailable = true,
    File? image,
  }) async {
    final menuService = ref.read(menuServiceProvider);
    await menuService.updateMenuItem(
      itemId: itemId,
      name: name,
      description: description,
      price: price,
      isAvailable: isAvailable,
      image: image,
    );
    // Refresh the menu items list after updating
    ref.invalidate(menuItemsProvider);
  };
});

// Provider for deleting menu items
final deleteMenuItemProvider = Provider((ref) {
  return (int itemId) async {
    final menuService = ref.read(menuServiceProvider);
    await menuService.deleteMenuItem(itemId);
    // Refresh the menu items list after deleting
    ref.invalidate(menuItemsProvider);
  };
});

// Provider for toggling item availability
final toggleItemAvailabilityProvider = Provider((ref) {
  return (int itemId, bool isAvailable) async {
    final menuService = ref.read(menuServiceProvider);
    await menuService.toggleItemAvailability(itemId, isAvailable);
    // Refresh the menu items list after toggling
    ref.invalidate(menuItemsProvider);
  };
});
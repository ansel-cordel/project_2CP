// lib/features/client/home/data/api_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_2cp/features/client/home/data/fetch_items.dart';
import 'package:project_2cp/features/client/home/data/restaurant_model.dart';
import 'package:project_2cp/features/client/orderlist/data/ordermodel.dart';


final confirmOrderActionProvider = Provider((ref) {
  return (int orderId) async {
    await ApiService.confirmOrder(orderId);
  };
});

// Fetch all restaurants
final restaurantsProvider = FutureProvider<List<Restaurant>>((ref) async {
  return ApiService.fetchRestaurants();
});

// Fetch popular item
final popularItemProvider = FutureProvider<Item>((ref) async {
  return ApiService.fetchPopularItem();
});

// Fetch all items
final allItemsProvider = FutureProvider<List<Item>>((ref) async {
  return ApiService.fetchItems();
});

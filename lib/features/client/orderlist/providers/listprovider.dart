import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/core/widgets/snack_bar_servide.dart';
import 'package:project_2cp/features/client/orderlist/data/Item_mdeol.dart';
import 'package:project_2cp/features/client/orderlist/providers/addorderidprovider.dart';

// Provider for managing the list of orders
final orderListProvider =
    StateNotifierProvider<OrderListNotifier, List<Item>>((ref) {
  return OrderListNotifier(ref);
});

class OrderListNotifier extends StateNotifier<List<Item>> {
  final Ref ref; 

  OrderListNotifier(this.ref)
      : super([]);

  void removeOrder(String orderId) {
    state = state.where((order) => order.id != orderId).toList();
    ref.read(idcountprovider.notifier).decrementid(); // ✅ safe now
  }

void addorder(Item addedorder) {
  // If the list is empty, just add the order
  if (state.isEmpty) {
    ref.read(idcountprovider.notifier).incrementid();
    state = [...state, addedorder];
    return;
  }

  // Check if item already exists in the order list
  final alreadyExists = state.any((item) => item.id == addedorder.id);
  if (alreadyExists) {
    SnackbarService.showSnackbar(
      message: "This item is already in your order.",
    );
    return;
  }

  // Get the restaurant ID of the first item in the list
  final existingRestoId = state.first.restaurantid;

  // Check if the new item comes from the same restaurant
  if (addedorder.restaurantid == existingRestoId) {
    ref.read(idcountprovider.notifier).incrementid();
    state = [...state, addedorder];
  } else {
    // Show Snackbar: can't add items from different restaurants
    SnackbarService.showSnackbar(
      message: "You can't add items from different restaurants.",
    );
  }
}
  void clearOrders() {
  state = [];
}
}

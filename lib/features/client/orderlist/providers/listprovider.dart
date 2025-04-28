import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/orderlist/data/ordermodel.dart';
import 'package:project_2cp/features/orderlist/providers/addorderidprovider.dart';

// Provider for managing the list of orders
final orderListProvider =
    StateNotifierProvider<OrderListNotifier, List<Order>>((ref) {
  return OrderListNotifier(ref);
});

class OrderListNotifier extends StateNotifier<List<Order>> {
  final Ref ref; // 👈 hold reference to read other providers

  OrderListNotifier(this.ref)
      : super([]);

  void removeOrder(String orderId) {
    state = state.where((order) => order.id != orderId).toList();
    ref.read(idcountprovider.notifier).decrementid(); // ✅ safe now
  }

  void addorder(Order addedorder) {
     ref.read(idcountprovider.notifier).incrementid();
    state = [...state, addedorder];
    
  }
  void clearOrders() {
  state = [];
}
}

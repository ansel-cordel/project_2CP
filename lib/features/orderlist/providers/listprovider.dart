import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/orderlist/data/ordermodel.dart';

// Provider for managing the list of orders
final orderListProvider =
    StateNotifierProvider<OrderListNotifier, List<Order>>((ref) {
  return OrderListNotifier();
});

class OrderListNotifier extends StateNotifier<List<Order>> {
  OrderListNotifier()
      : super([
          Order(
              id: "1",
              name: "Dorse",
              price: 1500,
              resto: "Woody Wood",
              image: "assets/dorse.jpeg"),
          Order(
              id: "2",
              name: "Pizza",
              price: 899,
              resto: "Pizza House",
              image: "assets/pizza.png"),
        ]);

  void removeOrder(String orderId) {
    state = state.where((order) => order.id != orderId).toList();
  }
}

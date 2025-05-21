
import 'package:project_2cp/features/client/orderhisyory/data/ordermodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderHistoryNotifier extends StateNotifier<List<OrderHistory>> {
  OrderHistoryNotifier() : super([]);

  void addOrders(OrderHistory newOrders) {
    state.add(newOrders); // Append converted orders
  }
}

final orderHistoryProvider =
    StateNotifierProvider<OrderHistoryNotifier, List<OrderHistory>>(
  (ref) => OrderHistoryNotifier(),
);



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/client/orderlist/data/Item_mdeol.dart';

class OrderHistoryNotifier extends StateNotifier<List<Item>> {
  OrderHistoryNotifier() : super([]);

  void addOrders(Item newOrders) {
    state.add(newOrders); // Append converted orders
  }
}

final orderHistoryProvider =
    StateNotifierProvider<OrderHistoryNotifier, List<Item>>(
  (ref) => OrderHistoryNotifier(),
);

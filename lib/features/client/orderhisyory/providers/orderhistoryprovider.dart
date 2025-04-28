import 'package:project_2cp/features/orderlist/data/ordermodel.dart';
import 'package:project_2cp/features/orderhisyory/data/ordermodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class OrderHistoryNotifier extends StateNotifier<List<OrderHistory>> {
  OrderHistoryNotifier() : super([


  ]);

  void addOrders(List<Order> newOrders) {
    List<OrderHistory> convertedOrders = newOrders.map((order) => OrderHistory.fromOrder(order)).toList();
    state = [...convertedOrders, ...state]; // Append converted orders
  }
}

final orderHistoryProvider = StateNotifierProvider<OrderHistoryNotifier, List<OrderHistory>>(
  (ref) => OrderHistoryNotifier(),
);
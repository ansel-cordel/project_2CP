import 'package:project_2cp/features/orderlist/data/ordermodel.dart';
import 'package:project_2cp/features/orderhisyory/data/ordermodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class OrderHistoryNotifier extends StateNotifier<List<OrderHistory>> {
  OrderHistoryNotifier() : super([
OrderHistory(date: "DD-MM-YYYY", price: 1500, state: 1, time: "HH-MM-SS"),
OrderHistory(date: "DD-MM-YYYY", price: 3500, state: 3, time: "HH-MM-SS")

  ]);

  void addOrders(List<Order> newOrders) {
    List<OrderHistory> convertedOrders = newOrders.map((order) => OrderHistory.fromOrder(order)).toList();
    state = [...convertedOrders, ...state]; // Append converted orders
  }
}

final orderHistoryProvider = StateNotifierProvider<OrderHistoryNotifier, List<OrderHistory>>(
  (ref) => OrderHistoryNotifier(),
);
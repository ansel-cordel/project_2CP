import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/client/orderlist/providers/listprovider.dart';
import 'package:project_2cp/features/client/orderlist/providers/orderprovider.dart';

final totalProvider = Provider<int>((ref) {
  final orders = ref.watch(orderListProvider);
  final quantities = ref.watch(amountProvider);

  return orders.fold(0, (sum, order) {
    final orderAmount = quantities[order.id] ?? 1;
    return sum + (order.price * orderAmount);
  });
});

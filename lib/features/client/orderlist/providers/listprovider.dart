import 'package:flutter_riverpod/flutter_riverpod.dart';
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
     ref.read(idcountprovider.notifier).incrementid();
    state = [...state, addedorder];
    
  }
  void clearOrders() {
  state = [];
}
}

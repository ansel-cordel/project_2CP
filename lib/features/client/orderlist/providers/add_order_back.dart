import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/client/orderlist/data/place_order_servide.dart';


final orderServiceProvider = Provider((ref) => OrderService());




class OrderStateNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final OrderService _orderService;

  OrderStateNotifier(this._orderService) : super(const AsyncValue.data({}));

  Future<void> placeOrder({
    required int clientId,
    required int restaurantId,
    required List<Map<String, dynamic>> items,
    required double totalPrice,
  }) async {
    state = const AsyncValue.loading();
    try {
      final result = await _orderService.placeOrder(
        clientId: clientId,
        restaurantId: restaurantId,
        items: items,
        totalPrice: totalPrice,
      );
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final orderStateNotifierProvider = StateNotifierProvider<OrderStateNotifier, AsyncValue<Map<String, dynamic>>>(
  (ref) => OrderStateNotifier(ref.watch(orderServiceProvider)),
);

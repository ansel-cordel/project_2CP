import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/client/orderhisyory/data/order_history_api_service.dart';
import 'package:project_2cp/features/client/orderhisyory/data/ordermodel.dart';


// Service provider
final orderHistoryServiceProvider = Provider<OrderHistoryService>((ref) {
  return OrderHistoryService();
});

// State notifier for order history
class OrderHistoryNotifier extends StateNotifier<AsyncValue<List<OrderHistory>>> {
  OrderHistoryNotifier(this._orderHistoryService) : super(const AsyncValue.loading());

  final OrderHistoryService _orderHistoryService;

  Future<void> fetchOrderHistory() async {
    state = const AsyncValue.loading();
    try {
      final orders = await _orderHistoryService.fetchOrderHistory();
      state = AsyncValue.data(orders);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void refresh() {
    fetchOrderHistory();
  }
}

// Provider for the order history notifier
final orderHistoryProvider = StateNotifierProvider<OrderHistoryNotifier, AsyncValue<List<OrderHistory>>>((ref) {
  final orderHistoryService = ref.watch(orderHistoryServiceProvider);
  return OrderHistoryNotifier(orderHistoryService);
});
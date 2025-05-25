import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/restaurantpage/data/fetching_orders.dart';
import 'package:project_2cp/features/restaurantpage/data/fetching_orders_models.dart';



final orderApiServiceProvider = Provider<OrderApiService>((ref) {
  const baseUrl = 'http://192.168.156.107:8000/api';
  return OrderApiService(baseUrl);
});

final restaurantOrdersProvider = FutureProvider.autoDispose<List<RestaurantOrder>>((ref) async {
  final apiService = ref.read(orderApiServiceProvider);
  return apiService.fetchRestaurantOrders();
});

// Alternative provider that allows manual refresh
final restaurantOrdersNotifierProvider = StateNotifierProvider<RestaurantOrdersNotifier, AsyncValue<List<RestaurantOrder>>>((ref) {
  return RestaurantOrdersNotifier(ref.read(orderApiServiceProvider));
});
final markOrderReadyProvider = StateNotifierProvider<MarkOrderReadyNotifier, AsyncValue<String?>>((ref) {
  return MarkOrderReadyNotifier(ref.read(orderApiServiceProvider));
});
class MarkOrderReadyNotifier extends StateNotifier<AsyncValue<String?>> {
  final OrderApiService _apiService;
  
  MarkOrderReadyNotifier(this._apiService) : super(const AsyncValue.data(null));
  
  Future<void> markOrderReady(int orderId) async {
    state = const AsyncValue.loading();
    try {
      final response = await _apiService.markOrderReady(orderId);
      state = AsyncValue.data(response.message);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  void clearState() {
    state = const AsyncValue.data(null);
  }
}

class RestaurantOrdersNotifier extends StateNotifier<AsyncValue<List<RestaurantOrder>>> {
  final OrderApiService _apiService;
  
  RestaurantOrdersNotifier(this._apiService) : super(const AsyncValue.loading()) {
    loadOrders();
  }
  
  Future<void> loadOrders() async {
    state = const AsyncValue.loading();
    try {
      final orders = await _apiService.fetchRestaurantOrders();
      state = AsyncValue.data(orders);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  Future<void> refresh() => loadOrders();
  
}
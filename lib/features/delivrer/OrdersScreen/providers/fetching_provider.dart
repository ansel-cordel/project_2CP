import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/data/fetching.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/data/models.dart';


final deliveryApiServiceProvider = Provider<DeliveryApiService>((ref) {
  const baseUrl = 'http://192.168.156.107:8000/api';
  return DeliveryApiService(baseUrl);
});


// Alternative provider that allows manual refresh
final readyOrdersNotifierProvider = StateNotifierProvider<ReadyOrdersNotifier, AsyncValue<List<DeliveryOrder>>>((ref) {
  return ReadyOrdersNotifier(ref.read(deliveryApiServiceProvider));
});

final HistoryOrdersNotifierProvider = StateNotifierProvider<HistoryOrdersNotifier, AsyncValue<List<DeliveryOrder>>>((ref) {
  return HistoryOrdersNotifier(ref.read(deliveryApiServiceProvider));
});

final pickupOrderProvider = StateNotifierProvider<PickupOrderNotifier, AsyncValue<String?>>((ref) {
  return PickupOrderNotifier(ref.read(deliveryApiServiceProvider));
});

class PickupOrderNotifier extends StateNotifier<AsyncValue<String?>> {
  final DeliveryApiService _apiService;
  
  PickupOrderNotifier(this._apiService) : super(const AsyncValue.data(null));
  
  Future<void> pickupOrder(int orderId) async {
    state = const AsyncValue.loading();
    try {
      final response = await _apiService.pickupOrder(orderId);
      state = AsyncValue.data(response.message);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  void clearState() {
    state = const AsyncValue.data(null);
  }
}
class HistoryOrdersNotifier extends StateNotifier<AsyncValue<List<DeliveryOrder>>> {
  final DeliveryApiService _apiService;
  
  HistoryOrdersNotifier(this._apiService) : super(const AsyncValue.loading()) {
    loadReadyOrders();
  }
  
  Future<void> loadReadyOrders() async {
    state = const AsyncValue.loading();
    try {
      final orders = await _apiService.fetchHistoryOrdersForDelivery();
      state = AsyncValue.data(orders);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  Future<void> refresh() => loadReadyOrders();
  
  // Helper method to remove a picked up order from the list
 
}
class ReadyOrdersNotifier extends StateNotifier<AsyncValue<List<DeliveryOrder>>> {
  final DeliveryApiService _apiService;
  
  ReadyOrdersNotifier(this._apiService) : super(const AsyncValue.loading()) {
    loadReadyOrders();
  }
  
  Future<void> loadReadyOrders() async {
    state = const AsyncValue.loading();
    try {
      final orders = await _apiService.fetchReadyOrdersForDelivery();
      state = AsyncValue.data(orders);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  Future<void> refresh() => loadReadyOrders();
  
  // Helper method to remove a picked up order from the list
  void removePickedUpOrder(int orderId) {
    final currentState = state;
    if (currentState is AsyncData<List<DeliveryOrder>>) {
      final orders = currentState.value;
      final updatedOrders = orders.where((order) => order.orderId != orderId).toList();
      state = AsyncValue.data(updatedOrders);
    }
  }
}
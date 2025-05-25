// place_order_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/client/home/data/fetch_items.dart';
import 'package:project_2cp/features/client/orderlist/data/Item_mdeol.dart';
// Your API service

// State for place order
class PlaceOrderState {
  final bool isLoading;
  final String? error;
  final Map<String, dynamic>? orderResponse;

  const PlaceOrderState({
    this.isLoading = false,
    this.error,
    this.orderResponse,
  });

  PlaceOrderState copyWith({
    bool? isLoading,
    String? error,
    Map<String, dynamic>? orderResponse,
  }) {
    return PlaceOrderState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      orderResponse: orderResponse ?? this.orderResponse,
    );
  }
}

// Notifier for place order
class PlaceOrderNotifier extends StateNotifier<PlaceOrderState> {
  PlaceOrderNotifier() : super(const PlaceOrderState());

  Future<void> placeOrder(List<Item> orderItems, int restaurantId) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await ApiService.placeOrder(orderItems, restaurantId);
      state = state.copyWith(
        isLoading: false,
        orderResponse: response,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void clearState() {
    state = const PlaceOrderState();
  }
}

// Provider
final placeOrderProvider = StateNotifierProvider<PlaceOrderNotifier, PlaceOrderState>((ref) {
  return PlaceOrderNotifier();
});
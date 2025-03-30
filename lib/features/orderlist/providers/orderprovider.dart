import 'package:flutter_riverpod/flutter_riverpod.dart';

// Manages quantity for each order individually
class AmountHandler extends StateNotifier<Map<String, int>> {
  AmountHandler() : super({});

  void increment(String orderId) {
    state = {
      ...state,
      orderId: (state[orderId] ?? 1) + 1,
    };
  }

  void decrement(String orderId) {
    if (state[orderId] != null && state[orderId]! > 1) {
      state = {
        ...state,
        orderId: state[orderId]! - 1,
      };
    }
  }

  int getAmount(String orderId) {
    return state[orderId] ?? 1;
  }
}

// Provider to access the AmountHandler
final amountProvider =
    StateNotifierProvider<AmountHandler, Map<String, int>>((ref) {
  return AmountHandler();
});

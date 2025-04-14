import 'package:flutter_riverpod/flutter_riverpod.dart';


class Amountprovider extends StateNotifier<int> {
  Amountprovider() : super(1);

  void increment() {
    state = state + 1;
  }

  void decrement() {
    if (state > 1) {
      state = state - 1;
    }
  }
}
final amountHandler =
    StateNotifierProvider<Amountprovider,int>((ref) {
  return Amountprovider();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for managing the current ID count
final idcountprovider = StateNotifierProvider<IdHandler, int>((ref) {
  return IdHandler();
});

class IdHandler extends StateNotifier<int> {
  IdHandler() : super(3); // starts from 3 since 1 & 2 already used

  void decrementid() {
    state--;
  }

  void incrementid() {
    state++;
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_2cp/features/delivrer/data/ordermodel.dart';


// Provider for managing the list of orders
final orderListDelProvider =
    StateNotifierProvider<OrderListNotifier, List<order>>((ref) {
  return OrderListNotifier(ref);
});

class OrderListNotifier extends StateNotifier<List<order>> {
  final Ref ref; 

  OrderListNotifier(this.ref)
      : super([]);

  

  void addorder(order addedorder) {
   
    state = [...state, addedorder];
    
  }
  
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/restaurantpage/data/add_item_servide.dart';
import 'package:project_2cp/features/restaurantpage/data/itemmodel.dart';


final menuServiceProvider = Provider<MenuItemService>((ref) {
  return MenuItemService();
});

final menuItemsProvider = FutureProvider<List<MenuItem>>((ref) async {
  final service = ref.watch(menuServiceProvider);
  return service.fetchMenuItems();
});
final confirmOrderProvider = Provider((ref) {
  return (int orderId) async {
    final repo = ref.read(menuServiceProvider);
    await repo.confirmOrder(orderId);
    // Optionally refetch orders after confirm:
    ref.invalidate(menuItemsProvider);
  };
});

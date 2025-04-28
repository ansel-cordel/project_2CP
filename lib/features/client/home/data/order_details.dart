import 'package:project_2cp/features/client/orderlist/data/ordermodel.dart';

class OrderDetails extends Order {
  final String description;
  final int quantity;
  OrderDetails({
    required super.id,
    required super.name,
    required super.resto,
    required super.image,
    required super.price,
    required this.description,
    required this.quantity,
  });
}

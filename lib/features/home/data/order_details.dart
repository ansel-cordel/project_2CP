import 'package:project_2cp/features/orderlist/data/ordermodel.dart';

class OrderDetails extends Order {
  final String description;
  final int quantity;
  OrderDetails({
    required String id,
    required String name,
    required String resto,
    required String image,
    required int price,
    required this.description,
    required this.quantity,
  }) : super(
          id: id,
          name: name,
          resto: resto,
          image: image,
          price: price,
        );
}

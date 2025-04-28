import 'package:project_2cp/features/client/orderlist/data/ordermodel.dart';

class OrderHistory {
  final String date;
  final String time;
  final int state;
  final int price;
  OrderHistory({
    required this.date,
    required this.price,
    required this.state,
    required this.time,
  });
  factory OrderHistory.fromOrder(Order order) {
    return OrderHistory(
      time:"HH-MM-SS" ,
      
      
      price: order.price,
      
      
      date: "DD-MM-YYYY",
      state: 0, // Default status
    );
  }
}

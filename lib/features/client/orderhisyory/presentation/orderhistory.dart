import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'orderhistorywidget.dart';
import 'package:project_2cp/core/widgets/search_widget.dart';

import 'package:project_2cp/features/client/orderhisyory/providers/orderhistoryprovider.dart';

class OrderHistoryPage extends ConsumerWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final confirmedOrders = ref.watch(orderHistoryProvider); // Ensure you pass the correct provider
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Search(),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Order History:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              itemCount: confirmedOrders.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    OrderHistoryCard(
                      date: "5555",
                      time: "è(è(è(è)))",
                      state: 1,
                      price: confirmedOrders[index].price,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

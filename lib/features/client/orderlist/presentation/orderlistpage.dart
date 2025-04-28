import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/core/providers/navigationprovider.dart';
import 'package:project_2cp/features/client/orderlist/presentation/orderwidget.dart';
import 'package:project_2cp/features/client/orderlist/providers/totalprovider.dart';
import 'package:project_2cp/core/widgets/search_widget.dart';
import 'package:project_2cp/features/client/orderlist/providers/listprovider.dart';
import 'package:project_2cp/features/client/orderhisyory/providers/orderhistoryprovider.dart';
// Optional: if you want to use Lottie
// import 'package:lottie/lottie.dart';

class OrderListPage extends ConsumerWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(orderListProvider);
    final totalPrice = ref.watch(totalProvider);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                "Order List:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: orders.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Use Lottie or Image here
                        // Lottie.asset('assets/animations/empty.json', width: screenWidth * 0.6),
                        Icon(Icons.receipt_long_rounded,
                            size: 100, color: Colors.grey.shade400),
                        SizedBox(height: 20),
                        Text(
                          "No orders yet.",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          OrderCard(
                            id: orders[index].id,
                            name: orders[index].name,
                            price: orders[index].price,
                            resto: orders[index].resto,
                            image: orders[index].image,
                            onDelete: () => ref
                                .read(orderListProvider.notifier)
                                .removeOrder(orders[index].id),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: orders.isEmpty
          ? null
          : SizedBox(
              height: 80,
              child: Container(
                width: screenWidth,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(-3, 0),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(3, 0),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total: $totalPrice DA",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(orderHistoryProvider.notifier)
                            .addOrders(orders);
                        ref.read(orderListProvider.notifier).clearOrders();
                        ref.read(bottomNavIndexProvider.notifier).state = 2;
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orangeAccent.withOpacity(0.4),
                              blurRadius: 8,
                              offset: const Offset(2, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Center(
                          child: Text(
                            "Confirm >",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 4,
                                  offset: const Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

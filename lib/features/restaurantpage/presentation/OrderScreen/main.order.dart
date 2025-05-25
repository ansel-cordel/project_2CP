import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/restaurantpage/presentation/OrderScreen/Order_widget.dart';
import 'package:project_2cp/features/restaurantpage/providers/fetching_orders_provider.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(restaurantOrdersProvider);
    double a = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("On Going Orders"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(restaurantOrdersProvider);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(restaurantOrdersProvider);
          return ref.read(restaurantOrdersProvider.future);
        },
        child: ordersAsync.when(
          data: (orders) {
            if (orders.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt_long,
                      size: a * 0.2,
                      color: Colors.grey,
                    ),
                    SizedBox(height: a * 0.05),
                    Text(
                      "No ongoing orders",
                      style: TextStyle(fontSize: a * 0.05),
                    ),
                    SizedBox(height: a * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        ref.invalidate(restaurantOrdersProvider);
                      },
                      child: const Text("Refresh"),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: a * 0.03, vertical: a * 0.05),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: a * 0.04),
                  child: Order(
                    order: order,
                    orderId:order.orderId ,
                    cliName: order.client.name,
                    cliNum: order.client.phoneNumber,
                    resPic: "res2",
                    // Uncomment these if your Order widget supports them:
                    // orderId: order.orderId.toString(),
                    // items: order.items,
                    // totalPrice: order.totalPrice,
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) {
            print('UI Error: $error'); // Debug
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: a * 0.15,
                    color: Colors.red,
                  ),
                  SizedBox(height: a * 0.03),
                  Text(
                    'Error loading orders',
                    style: TextStyle(
                      fontSize: a * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: a * 0.02),
                  Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: a * 0.035),
                  ),
                  SizedBox(height: a * 0.03),
                  ElevatedButton(
                    onPressed: () {
                      ref.invalidate(restaurantOrdersProvider);
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
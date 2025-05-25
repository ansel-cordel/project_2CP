import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/delivrer/HistoryScreen/Ongoing_text.dart';
import 'package:project_2cp/features/delivrer/HistoryScreen/OrderHistory_text.dart';
import 'package:project_2cp/features/delivrer/HistoryScreen/Orders.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/providers/fetching_provider.dart';
import 'package:project_2cp/features/delivrer/data/ordermodel.dart';
import 'package:project_2cp/features/delivrer/ProfileScreen/addprovider.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double a=MediaQuery.of(context).size.width;
    final readyOrdersAsync = ref.watch(HistoryOrdersNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left:a*0.22),
            child: OrderhistoryText(),
          ),
          Expanded(
              child: readyOrdersAsync.when(
              data: (deliveryOrders) {
                final safeOrders = deliveryOrders ?? [];
                if (deliveryOrders.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delivery_dining,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'You hqve no order History GET TO WORK',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        
                      ],
                    ),
                  );
                }
              
                print("HERE I AM I AM HEEEEEEEEEERE");              
                print(deliveryOrders.length);
                
                return RefreshIndicator(
                  onRefresh: () async {
                    
                   
                    // Refresh the orders list
                    await ref.read(HistoryOrdersNotifierProvider.notifier).refresh();
                  },
                  child: ListView.builder(
                 
                    itemCount: safeOrders.length,
                    itemBuilder: (context, index) {
                      // Add safety check to prevent out of range errors
                      if (index >= deliveryOrders.length) {
                        return const SizedBox.shrink();
                      }
                      
                      final deliveryOrder = deliveryOrders[index];
                      print("Processing order at index: $index");
                      
                     
                      

                     final currentOrder = deliveryOrders[index] ;
                    return history_orders(
                      total: currentOrder.totalPrice,
                      ResPic: "assets/noimage.png",
                      CliPic: "assets/noimage.png",
                      ResName: currentOrder.restaurant.name,
                      CliName: currentOrder.client.name,
                      ResLoc: currentOrder.restaurant.address,
                      CliLoc: currentOrder.client.address,
                      ResNum: currentOrder.restaurant.phoneNumber,
                      CliNum: currentOrder.client.phoneNumber,
                      isExpanded: true,
                    );

                      
                    },
                  ),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error loading orders',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      error.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(HistoryOrdersNotifierProvider.notifier).refresh();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
                  ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/OnGoing_text.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/Order_widget.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/providers/fetching_provider.dart';
import 'package:project_2cp/features/delivrer/data/ordermodel.dart';
import 'package:project_2cp/features/delivrer/ProfileScreen/addprovider.dart';

class DelivererOrderScreen extends ConsumerWidget {
  const DelivererOrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double a = MediaQuery.of(context).size.width;
    // Watch the ready orders from the API
    final readyOrdersAsync = ref.watch(readyOrdersNotifierProvider);
    final pickupState = ref.watch(pickupOrderProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: a * 0.1, left: a * 0.22),
              child: ongoingText(),
            ),
          ),
          
          // Show pickup status messages
          if (pickupState.isLoading)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          
          if (pickupState.hasError)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Error: ${pickupState.error}',
                  style: TextStyle(color: Colors.red.shade700),
                ),
              ),
            ),
          
          if (pickupState.hasValue && pickupState.value != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  pickupState.value!,
                  style: TextStyle(color: Colors.green.shade700),
                ),
              ),
            ),

          Expanded(
            child: readyOrdersAsync.when(
              data: (deliveryOrders) {
                final safeOrders = deliveryOrders ?? [];
                
                // Use safeOrders consistently for the empty check
                if (safeOrders.isEmpty) {
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
                          'No ready orders available',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Check back later for new orders',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              
                print("HERE I AM I AM HEEEEEEEEEERE");              
                print(safeOrders.length); // Use safeOrders for consistency
                
                return RefreshIndicator(
                  onRefresh: () async {
                    // Clear any previous pickup messages
                    ref.read(pickupOrderProvider.notifier).clearState();
                    // Refresh the orders list
                    await ref.read(readyOrdersNotifierProvider.notifier).refresh();
                  },
                  child: ListView.builder(
                    itemCount: safeOrders.length,
                    itemBuilder: (context, index) {
                      // Single safety check - don't redeclare safeOrders
                      if (index >= safeOrders.length || safeOrders.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      
                      final deliveryOrder = safeOrders[index];
                      
                      // Null check for the delivery order
                      if (deliveryOrder == null) {
                        return const SizedBox.shrink();
                      }
                      
                      // Convert DeliveryOrder to your existing order model for compatibility
                      final compatibleOrder = order(
                        total: deliveryOrder.totalPrice.toInt(),
                        clientloc: deliveryOrder.client.address,
                        client: deliveryOrder.client.name,
                        clientnumber: int.tryParse(deliveryOrder.client.phoneNumber.replaceAll(RegExp(r'[^\d]'), '')) ?? 0,
                        clientimg: "assets/person1.jpg", // Default image
                        restoloc: deliveryOrder.restaurant.address,
                        resto: deliveryOrder.restaurant.name,
                        restonumber: int.tryParse(deliveryOrder.restaurant.phoneNumber.replaceAll(RegExp(r'[^\d]'), '')) ?? 0,
                        restoimg: "assets/res1.png", // Default image
                      );

                      return GestureDetector(
                        onTap: () async {
                          // Show confirmation dialog before pickup
                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Confirm Pickup'),
                              content: Text(
                                'Do you want to pick up order #${deliveryOrder.orderId} from ${deliveryOrder.restaurant.name}?'
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.of(context).pop(true),
                                  child: const Text('Confirm Pickup'),
                                ),
                              ],
                            ),
                          );

                          if (confirmed == true) {
                            // Clear previous messages
                            ref.read(pickupOrderProvider.notifier).clearState();
                            
                            // Attempt pickup
                            await ref.read(pickupOrderProvider.notifier).pickupOrder(deliveryOrder.orderId);
                            
                            // Check if pickup was successful
                            final pickupResult = ref.read(pickupOrderProvider);
                            if (pickupResult.hasValue && pickupResult.value != null) {
                              // Remove the order from the list immediately
                              ref.read(readyOrdersNotifierProvider.notifier).removePickedUpOrder(deliveryOrder.orderId);
                              
                              // Add to your existing order provider if needed
                              ref.read(orderListDelProvider.notifier).addorder(compatibleOrder);
                            }
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 0, right: 0, bottom: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Order ID and Status
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Order #${deliveryOrder.orderId}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade100,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          deliveryOrder.status.toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.green.shade700,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  
                                  // Use your existing Orders widget
                                  Orders(
                                    resPic: compatibleOrder.restoimg,
                                    cliPic: compatibleOrder.clientimg,
                                    resName: compatibleOrder.resto,
                                    cliName: compatibleOrder.client,
                                    resLoc: compatibleOrder.restoloc,
                                    cliLoc: compatibleOrder.clientloc,
                                    resNum: compatibleOrder.restonumber,
                                    cliNum: compatibleOrder.clientnumber,
                                  ),
                                  
                                  const SizedBox(height: 12),
                                  
                                  // Total and Items info
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total: ${deliveryOrder.totalPrice.toStringAsFixed(2)} DA',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                      Text(
                                        '${deliveryOrder.items.length} items',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  
                                  const SizedBox(height: 8),
                                  
                                  // Pickup button
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton.icon(
                                      onPressed: pickupState.isLoading ? null : () async {
                                        // Same logic as the tap handler above
                                        final confirmed = await showDialog<bool>(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text('Confirm Pickup'),
                                            content: Text(
                                              'Do you want to pick up order #${deliveryOrder.orderId} from ${deliveryOrder.restaurant.name}?'
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.of(context).pop(false),
                                                child: const Text('Cancel'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () => Navigator.of(context).pop(true),
                                                child: const Text('Confirm Pickup'),
                                              ),
                                            ],
                                          ),
                                        );

                                        if (confirmed == true) {
                                          ref.read(pickupOrderProvider.notifier).clearState();
                                          await ref.read(pickupOrderProvider.notifier).pickupOrder(deliveryOrder.orderId);
                                          
                                          final pickupResult = ref.read(pickupOrderProvider);
                                          if (pickupResult.hasValue && pickupResult.value != null) {
                                            ref.read(readyOrdersNotifierProvider.notifier).removePickedUpOrder(deliveryOrder.orderId);
                                            ref.read(orderListDelProvider.notifier).addorder(compatibleOrder);
                                          }
                                        }
                                      },
                                      icon: const Icon(Icons.local_shipping),
                                      label: Text(pickupState.isLoading ? 'Processing...' : 'Pick Up Order'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
                        ref.read(readyOrdersNotifierProvider.notifier).refresh();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
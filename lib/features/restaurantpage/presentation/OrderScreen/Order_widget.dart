import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/restaurantpage/data/fetching_orders_models.dart';
import 'package:project_2cp/features/restaurantpage/providers/fetching_orders_provider.dart';

class Order extends ConsumerStatefulWidget {
  final String resPic;
  final String cliName;
  final String cliNum;
  final RestaurantOrder order; // Add the order object
  final int orderId; // Add order ID for API calls

  const Order({
    super.key,
    required this.resPic,
    required this.cliName,
    required this.cliNum,
    required this.order,
    required this.orderId,
  });

  @override
  ConsumerState<Order> createState() => _OrderState();
}

class _OrderState extends ConsumerState<Order> {
  bool isExpanded = false;
  int orderStatus = 0; // 0 = initial, 1 = taken, 2 = delivered

  void toggleCard() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void takeOrder() async {
    try {
      // Call the mark order ready API
      await ref.read(markOrderReadyProvider.notifier).markOrderReady(widget.orderId);
      
      // Check if successful
      final state = ref.read(markOrderReadyProvider);
      if (state.hasValue && state.value != null) {
        setState(() {
          orderStatus = 1;
        });
        
        // Show success message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.value!),
              backgroundColor: Colors.green,
            ),
          );
        }
        
        // Refresh orders list
        ref.invalidate(restaurantOrdersProvider);
      } else if (state.hasError) {
        // Show error message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.error.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      // Handle any other errors
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void confirmPickup() {
    setState(() {
      orderStatus = 2;
    });
  }

  Widget _buildItemRow(String item, String price, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item,
              style: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          Text(price,
              style: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final orangeColor = Colors.orange[800];
    final greyColor = Colors.grey[300];
    final markReadyState = ref.watch(markOrderReadyProvider);

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Customer Info Section
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(55, 110, 110, 110),
                  radius: width * 0.1,
                  child: CircleAvatar(
                    radius: width * 0.09,
                    backgroundImage: AssetImage("assets/${widget.resPic}"),
                  ),
                ),
                SizedBox(width: width * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, size: width * 0.06),
                        SizedBox(width: width * 0.02),
                        Text(widget.cliName,
                            style: TextStyle(
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.w800)),
                      ],
                    ),
                    SizedBox(height: width * 0.01),
                    Row(
                      children: [
                        Icon(Icons.phone_outlined, size: width * 0.05),
                        SizedBox(width: width * 0.02),
                        Text(widget.cliNum,
                            style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),

          // Divider
          Container(height: 2, color: Colors.grey[400]),

          // Expandable Order Details
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: isExpanded
                ? Container(
                    padding: EdgeInsets.all(width * 0.04),
                    color: greyColor,
                    child: Column(
                      children: [
                        Text("Order List:",
                            style: TextStyle(
                            fontSize: width * 0.05,
                                fontWeight: FontWeight.w600)),
                        // Display actual order items from API
                        ...widget.order.items.map((item) => 
                          _buildItemRow(
                            item.itemName, 
                            "${item.price.toStringAsFixed(2)} Da x ${item.quantity}", 
                            width
                          )
                        ),
                        SizedBox(height: width * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total:",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w600)),
                            Text("${widget.order.totalPrice.toStringAsFixed(2)} Da",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w600)),
                          ],
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
          ),

          // Divider
          Container(height: 2, color: Colors.grey[400]),

          // Buttons Section with fixed white background
          SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(width*0.03)),
                color: Colors.white
              ),
              padding: EdgeInsets.all(width * 0.02),
              child: Column(
                children: [
                  if (orderStatus == 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: markReadyState.isLoading ? null : takeOrder,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: orangeColor,
                              padding: EdgeInsets.symmetric(
                                  vertical: width * 0.03),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: markReadyState.isLoading
                                ? SizedBox(
                                    height: width * 0.04,
                                    width: width * 0.04,
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text("Take Order",
                                    style: TextStyle(
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[600],
                              padding: EdgeInsets.symmetric(
                                  vertical: width * 0.03),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text("Cancel",
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                      ],
                    )
                  else if (orderStatus == 1)
                    ElevatedButton(
                      onPressed: confirmPickup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orangeColor,
                        padding: EdgeInsets.symmetric(
                          vertical: width * 0.03,
                          horizontal: width * 0.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Confirm Order Pickup",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    )
                  else
                    ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(
                          vertical: width * 0.03,
                          horizontal: width * 0.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Delivered",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  IconButton(
                    onPressed: toggleCard,
                    icon: Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      size: width * 0.08,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
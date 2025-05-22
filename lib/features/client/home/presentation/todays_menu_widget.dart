import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:project_2cp/core/widgets/details.dart';
import 'package:project_2cp/features/client/home/providers/amountprovider.dart';
import 'package:project_2cp/features/client/home/providers/fetchingprovider.dart';
import 'package:project_2cp/features/client/orderlist/data/Item_mdeol.dart';
import 'package:project_2cp/features/client/orderlist/providers/addorderidprovider.dart';
import 'package:project_2cp/features/client/orderlist/providers/listprovider.dart';

class TodaysMenuWidget extends ConsumerWidget {
  final String image;
  final String name;
  final String restaurant;
  final int price;

  const TodaysMenuWidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = ref.watch(restaurantsProvider);
    final amount = ref.watch(amountHandler);
    final currentId = ref.read(idcountprovider).toString();
    final screenWidth = MediaQuery.of(context).size.width;

    return restaurants.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Text('Error loading popular item: $error'),
      ),
      data: (popularitem2) {
        return GestureDetector(
          onTap: () => Get.to(OrderDetail(
              name: popularitem2[0].items[0].name,
              resto: popularitem2[0].items[0].resto,
              price: popularitem2[0].items[0].price,
              amount: amount,
              description: popularitem2[0].items[0].description,
              image: popularitem2[0].items[0].image ?? "")),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            child: Image.asset(
                              popularitem2[0].items[0].image ?? "",
                              height: screenWidth * 0.4,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        popularitem2[0].items[0].name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            ref
                                                .read(amountHandler.notifier)
                                                .decrement();
                                          },
                                          icon: const Icon(Icons.remove),
                                        ),
                                        Text(
                                          amount.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            ref
                                                .read(amountHandler.notifier)
                                                .increment();
                                          },
                                          icon: const Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Wrap(
                                    spacing: 4,
                                    children: [
                                      Text(
                                        popularitem2[0].items[0].resto,
                                        style: TextStyle(color: Colors.grey[850]),
                                      ),
                                      const Text("•"),
                                      const Text("Fast Food"),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${popularitem2[0].items[0].price} DA",
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 25,
                      right: 20,
                      child: FloatingActionButton(
                        mini: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        onPressed: () {
                          ref.read(orderListProvider.notifier).addorder(
                                Item(
                                  isAvailable: true,
                                  id: currentId,
                                  image: popularitem2[0].items[0].image,
                                  name: popularitem2[0].items[0].name,
                                  price: popularitem2[0].items[0].price,
                                  resto: popularitem2[0].items[0].resto,
                                  description: popularitem2[0].items[0].description,
                                ),
                              );
                        },
                        backgroundColor: Colors.orange[800],
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 15,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange[800],
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "4.8",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
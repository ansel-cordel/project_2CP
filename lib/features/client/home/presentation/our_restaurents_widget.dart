import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_2cp/features/client/home/providers/amountprovider.dart';
import 'package:project_2cp/features/client/orderlist/data/ordermodel.dart';
import 'package:project_2cp/features/client/orderlist/providers/addorderidprovider.dart';
import 'package:project_2cp/features/client/orderlist/providers/listprovider.dart';

class OurRestaurentsWidget extends ConsumerWidget {
  final String name;
  final String specialities;
  final String location;
  final String image;
  final int rate;

  const OurRestaurentsWidget({
    super.key,
    required this.name,
    required this.location,
    required this.specialities,
    required this.image,
    required this.rate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = ref.watch(amountHandler);
    final currentId = ref.read(idcountprovider).toString();
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textScale = screenWidth / 400;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(
                                  name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18 * textScale,
                                  ),
                                  softWrap: true,
                                  maxLines: null,
                                ),
                              ),
                            ),
                            Card(
                              elevation: 2,
                              shadowColor: Colors.black,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 1.7,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange[800],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      "4.8",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
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
                        ),
                        Text(
                          specialities,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12 * textScale,
                          ),
                          softWrap: true,
                          maxLines: null,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          location,
                          style: TextStyle(
                            fontSize: 16 * textScale,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                          maxLines: null,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            "Best Menus:",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height:200,
          
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.5),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.asset(
                                image,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 15,
                              left: 15,
                              child: Card(
                                elevation: 2,
                                shadowColor: Colors.black,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 1.7,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.orange[800],
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text(
                                        "4.8",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
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
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      name,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            ref.read(amountHandler.notifier).decrement();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          amount.toString(),
                                          style: const TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            ref.read(amountHandler.notifier).increment();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Restaurant Name",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    " * ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Fast Food",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: const [
                                  Text(
                                    "\$Price",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 21,
                      right: 18,
                      child: FloatingActionButton(
                        mini: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        onPressed: () {
                          ref.read(orderListProvider.notifier).addorder(
                                Order(
                                  id: currentId,
                                  image: image,
                                  name: name,
                                  price: 0, // <-- You have to replace 0 with the real `price` variable
                                  resto: "Restaurant Name", // <-- replace with real `restaurant`
                                ),
                              );
                        },
                        backgroundColor: Colors.orange[800],
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 34,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

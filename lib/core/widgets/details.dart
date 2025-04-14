import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/orderlist/data/ordermodel.dart';
import 'package:project_2cp/features/orderlist/providers/addorderidprovider.dart';
import 'package:project_2cp/features/orderlist/providers/listprovider.dart';

class OrderDetail extends ConsumerWidget {
  final String image;
  final String name;
  final String resto;
  final int amount;
  final String description;
  final int price;

  const OrderDetail({
    super.key,
    required this.name,
    required this.resto,
    required this.price,
    required this.amount,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentId = ref.read(idcountprovider).toString();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
                Positioned(
                  left: 10,
                  top: 40,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Colors.deepOrangeAccent),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const Icon(Icons.location_on, color: Colors.deepOrangeAccent),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                resto,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: const [
                  Icon(Icons.star, color: Colors.deepOrangeAccent, size: 18),
                  SizedBox(width: 4),
                  Text("4.8 Rating",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 16),
                  Icon(Icons.shopping_bag_outlined, size: 18),
                  SizedBox(width: 4),
                  Text("7000+ Orders",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                description,
                style: const TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 160,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$price DA",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove, color: Colors.orange),
                        onPressed: () {},
                      ),
                      Text(amount.toString(),
                          style: const TextStyle(fontSize: 18)),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.orange),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  ref.read(orderListProvider.notifier).addorder(Order(
                        id: currentId,
                        image: image,
                        name: name,
                        price: price,
                        resto: resto,
                      ));
                },
                child: const Text("Add To Cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

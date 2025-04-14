import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  final String image;
  final String name;
  final String resto;
  final int amount;
  final String description;
  final int price;

  const OrderDetail({super.key,
  required this.name
  ,required this.resto
  ,required this.price
  ,required this.amount
  ,required this.description
  ,required this.image});

  @override
  Widget build(BuildContext context) {
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
                    child: Image.asset("images/pizza.png",
                        width: double.infinity, fit: BoxFit.cover)),
                Positioned(
                  left: 10,
                  top: 40,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Colors.deepOrangeAccent),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Fish Au Chocolat",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Icon(Icons.location_on, color: Colors.deepOrangeAccent),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child:
                  Text("Fish Brother Fr", style: TextStyle(color: Colors.grey)),
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
                  Text("7000+ Order",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Text(
                "Beautiful Fish Made with chocolate and spices. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut consequat tortor. Pellentesque pretium eros neque, vel tempor mauris volutpat sed.",
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("700DA",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove, color: Colors.orange),
                        onPressed: () {},
                      ),
                      const Text("1", style: TextStyle(fontSize: 18)),
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
                onPressed: () {},
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:project_2cp/core/widgets/details.dart';
import 'package:project_2cp/features/client/home/providers/amountprovider.dart';
import 'package:project_2cp/features/client/orderlist/data/Item_mdeol.dart';
import 'package:project_2cp/features/client/orderlist/providers/listprovider.dart';
import 'package:project_2cp/features/restaurant/main_page.dart';

class OurRestaurantsWidget extends ConsumerWidget {
  final String restaurantid;
  final String name;
  final String specialities;
  final String number;
  final String location;
  final String image;
  final int rate;
  final List<Item> items;

  const OurRestaurantsWidget({
super.key,
required this.restaurantid,
    required this.number,
     required this.items,
    required this.name,
    required this.location,
    required this.specialities,
    required this.image,
    required this.rate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final amount = ref.watch(amountHandler);

    

    return Card(
      margin: EdgeInsets.all(width * 0.02),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width * 0.03),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRestaurantInfoSection(width),
            Padding(
              padding: EdgeInsets.only(left: width * 0.04, top: width * 0.02),
              child: Text(
                "Best Menus:",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: width * 0.05,
                ),
              ),
            ),
            SizedBox(
              height: width * 0.46,
              child: ListView.builder(
                padding: EdgeInsets.only(left: width * 0.01),
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(
                      OrderDetail(
                        restaurantid: restaurantid,
                        id: items[index].id,
                        name: items[index].name,
                        resto: items[index].resto,
                        price: items[index].price,
                        amount: amount,
                        description: items[index].description,
                        image: items[index].image ?? "",
                      ),
                    ),
                    child: Container(
                      width: width * 0.5,
                      margin: EdgeInsets.only(
                        right: width * 0.04,
                        bottom: width * 0.02,
                      ),
                      child: Stack(
                        children: [
                          _buildMenuCard(
                              width, items[index].image ?? "", items[index].name,items[index].price),
                          Positioned(
                            bottom: width * 0.03,
                            right: width * 0.03,
                            child: _buildAddButton(
                              width,
                              onPressed: () {
                                ref.read(orderListProvider.notifier).addorder(Item(
                    isAvailable: true,
                        restaurantid: restaurantid,
                        description: items[index].description,
                        id: items[index].id,
                        image: items[index].image,
                        name: items[index].name,
                        price: items[index].price,
                        resto: name,
                      ));
                                
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantInfoSection(double width) {
    return SizedBox(
      height: width * 0.25,
      width: double.infinity,
      child: InkWell(
        onTap: () => Get.to( restaurant_page(restaurantid: restaurantid,items:items,location: location,number:number ,name: name,image: image,)),
        borderRadius: BorderRadius.circular(width * 0.03),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(width * 0.03),
          child: Container(
padding: EdgeInsets.all(width * 0.01),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(width * 0.03),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(width * 0.04),
                  child: Image.asset(
                    image,
                    width: width * 0.25,
                    height: width * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: width * 0.03),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.05,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            _RatingBadge(rate: rate),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              specialities,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: width * 0.033,
                              ),
                            ),
                            SizedBox(height: width * 0.01),
                            Text(
                              location,
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(double width, String image, String name,double price) {
    return Card(
      elevation: width * 0.009,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.035),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(width * 0.035),
            ),
            child: Image.network(
              "http://192.168.156.107:8000$image",
              height: width * 0.22,
              width: double.infinity,
              fit: BoxFit.cover,
               errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/noimage.png', 
               height: width * 0.22,
              width: double.infinity,
              fit: BoxFit.cover,// your fallback image
              
            );
          },
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
            ),
          ),
          Container(
            height: width * 0.18,
            padding: EdgeInsets.only(
              top: width * 0.008,
              left: width * 0.015,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: width * 0.036,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        price.toString(),
                        style: TextStyle(
fontSize: width * 0.042,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(double width, {required VoidCallback onPressed}) {
    return SizedBox(
      width: width * 0.08,
      height: width * 0.08,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width * 0.1),
        ),
        onPressed: onPressed,
        backgroundColor: Colors.orange[800],
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: width * 0.06,
        ),
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final int rate;

  const _RatingBadge({required this.rate});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.01,
          vertical: width * 0.001,
        ),
        decoration: BoxDecoration(
          color: Colors.orange[800],
          borderRadius: BorderRadius.circular(width * 0.013),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rate.toDouble().toStringAsFixed(1),
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.star, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }
}
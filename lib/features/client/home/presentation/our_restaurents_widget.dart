import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:project_2cp/core/widgets/details.dart';
import 'package:project_2cp/features/client/home/providers/amountprovider.dart';

import 'package:project_2cp/features/client/orderlist/providers/addorderidprovider.dart';

import 'package:project_2cp/features/restaurant/main_page.dart';

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
    final imagesList = [
      "assets/BBQ.jpg",
      "assets/pasta_salad.jpg",
      "assets/salamon.jpg",
      "assets/pizza2.jpg",
      "assets/salamon.jpg"
    ];

    final namesList = [
      "Turkish BBQ",
      "Pasta Salad",
      "Salad",
      "Cheese Pizza",
      "Salmon"
    ];
    final amount = ref.watch(amountHandler);
    final currentId = ref.read(idcountprovider).toString();

    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double textScale = width / 400;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
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
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () => Get.to(restaurant_page()),
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18 * textScale,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              _RatingBadge(rate: rate),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            specialities,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12 * textScale,
                            ),
                            softWrap: true,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            location,
                            style: TextStyle(
                              fontSize: 16 * textScale,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
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
              height: 150,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.5),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: ()=> Get.to(OrderDetail(name: namesList[index], resto: "Fast Order", price:1500, amount: amount, description: "this is a item thats very delicious what do u think about would like to try it ?", image:imagesList[index])),
                    child: SizedBox(
                            height: MediaQuery.of(context).size.width*0.4,
                            width: MediaQuery.of(context).size.width*0.5,
                            child: Stack( 
                            children: [
                            Card(
                              elevation: 5,
                              shadowColor: Colors.black,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                  MediaQuery.of(context).size.width*0.05
                                ),
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          MediaQuery.of(context).size.width*0.05
                        )
                      ),
                      child: Image.asset(
                        imagesList[index],
                        height:MediaQuery.of(context).size.width*0.22,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width*0.02,
                      left: MediaQuery.of(context).size.width*0.02,
                      child: Card(
                        elevation: 2,
                        shadowColor: Colors.black,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical:MediaQuery.of(context).size.width*0.007,
                            horizontal:MediaQuery.of(context).size.width*0.015 
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange[800],
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.013),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "4.8",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width*0.027,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.01),
                              Icon(Icons.star, color: Colors.white, size: MediaQuery.of(context).size.width*0.034),
                            ],
                          ),
                        ),
                      ),
                    ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                    height: MediaQuery.of(context).size.width*0.16,
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width*0.008,
                      left: MediaQuery.of(context).size.width*0.017,
                      bottom: MediaQuery.of(context).size.width*0.04,
                    ),
                    child:Row(
                      children: [
                           SizedBox(
                            width: MediaQuery.of(context).size.width*0.3,
                             child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(namesList[index],
                                    style: TextStyle(
                                      fontSize:MediaQuery.of(context).size.width*0.036, 
                                      fontWeight: FontWeight.w600
                                    ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("1500",
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.042,
                                      fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  )
                                ],
                              ),
                           ),
                      ],
                    ), 
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: MediaQuery.of(context).size.width*0.029,
                              right: MediaQuery.of(context).size.width*0.029,
                              child: SizedBox(
                                height: MediaQuery.of(context).size.width*0.065,
                                width: MediaQuery.of(context).size.width*0.065,
                                child: FloatingActionButton(
                                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)) ,
                                  onPressed: () {},
                                  backgroundColor: Colors.orange[800],
                                  child: Icon(Icons.add, color: Colors.white,size: MediaQuery.of(context).size.width*0.05,),
                                ),
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
        );
      },
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final int rate;

  const _RatingBadge({required this.rate});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.7),
        decoration: BoxDecoration(
          color: Colors.orange[800],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rate.toStringAsFixed(1),
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

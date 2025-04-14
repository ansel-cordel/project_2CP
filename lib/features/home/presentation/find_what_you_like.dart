import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2cp/core/widgets/details.dart';

class FindWhatYouLikeText extends StatelessWidget {
  const FindWhatYouLikeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          "Find What You Like:",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}


class FindWhatYouLikeWidget extends StatelessWidget {
  const FindWhatYouLikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
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

    return SizedBox(
      height: 250,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.85),
        itemCount: imagesList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(OrderDetail(image:imagesList[index],name:namesList[index],price:1500,resto:"Food Express",amount:1,description:"kzjhgvuhagcuzaevuzegcizegcuyzebfuzefvcjzevuyzevkjzevuyzibvkzrvihzkbviuzegv zkudgvozrnviuzrgvoznvoze_hvozieenv izhvoiznvzev"));
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                children: <Widget>[
                  Container(
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        imagesList[index],
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        namesList[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

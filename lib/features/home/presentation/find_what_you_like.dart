import 'package:flutter/material.dart';
import 'package:project_2cp/core/widgets/search_widget.dart';

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
      height: 300,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.5),
        itemCount: imagesList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
onTap: ()  {
  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => CustomSearchPage(initialQuery: namesList[index]),
  ),
);

},
            child: Container(
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      imagesList[index],
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 15,
                      child: Text(
                        namesList[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
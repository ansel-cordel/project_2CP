import 'package:flutter/material.dart';
import 'package:project_2cp/core/widgets/search_widget.dart';

class FindWhatYouLikeText extends StatelessWidget {
  const FindWhatYouLikeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            "Find What You Like:",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
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
    double a=MediaQuery.of(context).size.width;
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

    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight == double.infinity
            ? MediaQuery.of(context).size.height * 0.35
            : constraints.maxHeight;

        return SizedBox(
          height: height,
          child: ListView.builder(
            padding: EdgeInsets.only(left: a*0.03), // Add left padding here
            scrollDirection: Axis.horizontal,
            itemCount: imagesList.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.4, // Same as viewportFraction
                margin: EdgeInsets.only(
                  right: a*0.03, // Space between items
                  left: index == 0 ? 0 : 0, // No extra left padding for first item
                ),
                child: GestureDetector(
                  onTap: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            SearchDelegateImpl(initialQuery: namesList[index]),
                      ),
                    );*/
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(a*0.04),
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
                      borderRadius: BorderRadius.circular(a*0.04),
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
                            right: 15,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
namesList[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
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
    );
  }
}
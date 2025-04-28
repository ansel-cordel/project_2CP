import 'package:flutter/material.dart';
import 'package:project_2cp/features/home/presentation/todays_menu_widget.dart';

class OurRestaurentsWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textScale = screenWidth / 400;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            // Removed fixed height
            width: screenWidth * 1,
           
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 1.7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange[800],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
          height: 130,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return TodaysMenuWidget(
                image: image,
                name: name,
                price: 1500,
                restaurant: specialities,
              );
            },
          ),
        ),
      ],
    );
  }
}

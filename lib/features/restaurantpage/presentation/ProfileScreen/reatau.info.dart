import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:project_2cp/features/restaurantpage/presentation/ProfileScreen/food_types.dart/main_food.dart';

class RestauInfo_text extends StatelessWidget {
  const RestauInfo_text({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Restaurant Info",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        Icon(
          Icons.house,
          size: MediaQuery.of(context).size.width * 0.06,
        )
      ],
    );
  }
}

class RestauInfo extends StatefulWidget {
  const RestauInfo({super.key});

  @override
  _RestauInfoState createState() => _RestauInfoState();
}

class _RestauInfoState extends State<RestauInfo> {
  String? startTime;
  String? endTime;

  final List<String> timeOptions = ["8:00", "9:00", "10:00", "11:00", "12:00"];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.17,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(15, 0, 0, 0),
            width: screenWidth * 0.0025,
          ),
          borderRadius: BorderRadius.circular(screenHeight * 0.017),
          color: Colors.white54,
        ),
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.02,
          horizontal: screenWidth * 0.03,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Working hours",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
                Row(
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: false,
                        hint: Text(
                          "Start",
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                        items: timeOptions
                            .map((time) => DropdownMenuItem(
                                  value: time,
                                  child: Text(time),
                                ))
                            .toList(),
                        value: startTime,
                        onChanged: (value) {
                          setState(() {
                            startTime = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 40,
                          width: 80,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      " - ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: false,
                        hint: Text(
                          "End",
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                        items: timeOptions
                            .map((time) => DropdownMenuItem(
                                  value: time,
                                  child: Text(time),
                                ))
                            .toList(),
                        value: endTime,
                        onChanged: (value) {
                          setState(() {
                            endTime = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 40,
                          width: 80,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Edit Restaurant type",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(types());
                  },
                  icon: Icon(
                    Icons.edit,
                    size: screenWidth * 0.045,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

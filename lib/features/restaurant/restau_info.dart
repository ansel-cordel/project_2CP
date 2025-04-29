import 'package:flutter/material.dart';

class RestauInfo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
        height: MediaQuery.of(context).size.width*0.4,
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.location_on_outlined,
                size: MediaQuery.of(context).size.width*0.06,
                color: Colors.grey[800],
                weight: MediaQuery.of(context).size.width*0.05,
                ),
            
                Expanded(
                  child: Text(" We gon come and blow new jersy up BANG BANG!!!",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width*0.037,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[800],
                  ),
                  ),
                )
              ],
            ),
      
            Text("__________________________________________________",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width*0.038,
            ),
            ),
      
            Row(
              children: [
                Icon(Icons.phone_outlined,
                size: MediaQuery.of(context).size.width*0.06,
                color: Colors.grey[800],
                weight: MediaQuery.of(context).size.width*0.05,
                ),
            
                Expanded(
                  child: Text(" 0553740984",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width*0.037,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[800],
                  ),
                  ),
                )
              ],
            ),
      
            Text("__________________________________________________",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width*0.038,
            ),
            ),
      
            Row(
              children: [
                Icon(Icons.watch_later_outlined,
                size: MediaQuery.of(context).size.width*0.06,
                color: Colors.grey[800],
                weight: MediaQuery.of(context).size.width*0.05,
                ),
            
                Expanded(
                  child: Text(" 8:00AM - 11:00PM",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width*0.037,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[800],
                  ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  
}
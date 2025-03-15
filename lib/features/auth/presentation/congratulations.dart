import 'package:flutter/material.dart';
class Congratulations extends StatelessWidget { 
   
 
  @override 
  Widget build(BuildContext context) { 
    double screenWidth = MediaQuery.of(context).size.width; 
    double screenHeight = MediaQuery.of(context).size.height; 
    return MaterialApp( 
      home: Scaffold( 
        body: Center(heightFactor: screenHeight,widthFactor: screenWidth, 
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment:CrossAxisAlignment.center, 
            children: [ 
              Expanded( 
                flex:6, 
                child: Container( 
                  padding: EdgeInsets.only(bottom: 10), 
                  alignment: Alignment.bottomCenter, 
                  child: Image.asset("assets/congrats.png")), 
              ), 
              Expanded( 
                flex:2, 
                child: Container( 
                  alignment: Alignment.center, 
                  child: Text("Congratulations!",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 40),))), 
              Expanded( 
                flex:5, 
                child: Container( 
                  alignment: Alignment.topCenter, 
                  padding: EdgeInsets.symmetric(horizontal: 50), 
                  child: Text("You Have Successfully Created an Account" 
                  ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 23),textAlign: TextAlign.center,)), 
              ) 
            ], 
          ), 
        ) 
      ), 
    ); 
  } 
}
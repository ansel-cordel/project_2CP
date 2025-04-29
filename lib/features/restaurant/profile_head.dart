import 'package:flutter/material.dart';

class ProfileHead extends StatefulWidget{
  const ProfileHead ({super.key});

  @override
  _ProfileHeadState createState() =>_ProfileHeadState();  
}

class _ProfileHeadState extends State<ProfileHead>{
  @override
  Widget build(BuildContext context) {
   return SizedBox(
    height: MediaQuery.of(context).size.width*0.4,
     child: Stack(
       children: [
         Container(
           height: MediaQuery.of(context).size.width*0.4,
           decoration: BoxDecoration(
             image: DecorationImage(
               image:AssetImage("assets/background.avif"),
               fit: BoxFit.cover,
             )
           ),
         ),

         Container(
           height: MediaQuery.of(context).size.width*0.4,
           decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:[
                Colors.black.withAlpha((0.6 * 255).round()),
                Colors.transparent
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
            )
           ),
         ),
         
         Positioned(
          top: MediaQuery.of(context).size.width*0.0725,
          left: MediaQuery.of(context).size.width*0.0725,
          child: Row(
            children: [
              ClipRRect(
                borderRadius:BorderRadius.circular(MediaQuery.of(context).size.width*0.03),
                child: Image.asset("assets/res2.png",
                width: MediaQuery.of(context).size.width*0.255,
                height: MediaQuery.of(context).size.width*0.255,
                fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: MediaQuery.of(context).size.width*0.03,),

              SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("LebronFc",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.07,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      ),
                    ),
                
                    Text("Fast Food * Sandwich * Pizaa",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width*0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
        Positioned(
          top: MediaQuery.of(context).size.width*0.04,
          right: MediaQuery.of(context).size.width*0.04,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width*0.01,
              horizontal: MediaQuery.of(context).size.width*0.015
            ),
            decoration: BoxDecoration(
              color: Colors.orange[800],
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.013),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "7.0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width*0.033,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.01),
                Icon(Icons.star, color: Colors.white, size: MediaQuery.of(context).size.width*0.038),
              ],
            ),
          ),
        ),
       ],
     ),
   );
  }

}
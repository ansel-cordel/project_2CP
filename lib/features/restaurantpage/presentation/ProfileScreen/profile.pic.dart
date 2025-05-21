import 'package:flutter/material.dart';

class Profile_pic extends StatelessWidget{
  const Profile_pic({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children:[ 
          Container(
            width: MediaQuery.of(context).size.width*0.28,
            height: MediaQuery.of(context).size.width*0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.02),
              color: const Color.fromARGB(32, 239, 108, 0),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width*0.014,
            left: MediaQuery.of(context).size.width*0.014,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.01),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.25,
                  height: MediaQuery.of(context).size.width*0.25,
                  child: Image.asset("img/r1.jpg",fit: BoxFit.cover,),
                  ),
            ),
          ),

          Positioned(
              bottom: 1,
              right: 1,
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.028,
                width: MediaQuery.of(context).size.width*0.053,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.053)),
                  mini: true,
                  onPressed: (){},
                  backgroundColor: Colors.orange[800],
                  child: Icon(
                    Icons.edit_outlined,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width*0.043,
                  ),
                  ),
              ),
            ),
          ]
        ),

        SizedBox(width: MediaQuery.of(context).size.width*0.026,),


        //info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("l wiaam food",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width*0.0458,
                fontWeight: FontWeight.w700,
              ),
              ),
              Text("Current rating :",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width*0.038,
                fontWeight: FontWeight.w500,
              ),
              ),

              //the rating
              Row(
                children: [
                  Icon(Icons.star,size: MediaQuery.of(context).size.width*0.06,color: Colors.orange[800],),
                  Text("4.8",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width*0.05,
                    fontWeight: FontWeight.w500 
                  ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
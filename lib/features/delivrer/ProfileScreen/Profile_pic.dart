import 'package:flutter/material.dart';

class ProfilePic extends StatefulWidget{
  const ProfilePic({super.key});

  @override
_ProfilePicState createState()=> _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic>{
  @override
  Widget build(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor:  const Color.fromARGB(53, 254, 179, 117),
              radius: 55,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage("assets/cat.jpg"),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.035,
                width: MediaQuery.of(context).size.width*0.06,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                  mini: true,
                  onPressed: (){},
                  backgroundColor: Colors.orange[800],
                  child: Icon(Icons.edit_outlined,color: Colors.white,size: 20,),
                  ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  }
}
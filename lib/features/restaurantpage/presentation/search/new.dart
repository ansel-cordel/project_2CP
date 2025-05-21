import 'package:flutter/material.dart';

class neww extends StatefulWidget{
  final String image;

  const neww({super.key, 
    required this.image
  });
  @override
  _newwState createState()=> _newwState();
}

class _newwState extends State<neww> {
  String image ="yetler";
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){},
      child:Container(
        height: MediaQuery.of(context).size.width*0.3,
        width: MediaQuery.of(context).size.width*0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.01),
          color: Colors.blueAccent[900],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(MediaQuery.of(context).size.width*0.3)),
                  child: Image.asset("img/${widget.image}.jpg",
                  fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      );
  }

}
import 'package:flutter/material.dart';

class edit extends StatefulWidget{
  const edit({super.key});

  @override
  _editState createState()=> _editState();
}

class _editState extends State<edit>{
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed:(){
    },
    color: Colors.orange[800],
    height:MediaQuery.of(context).size.height*0.06,
    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.013),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.04),
    ),
    child: Center(
      child: Text("Edit",
      style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045,
      fontWeight: FontWeight.w900,
      color: Colors.white,
      ),
      ),
    ),
    );
  }

}
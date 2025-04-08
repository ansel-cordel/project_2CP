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
    height:MediaQuery.of(context).size.height*0.08,
    padding: EdgeInsets.symmetric(vertical: 17),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17),
    ),
    child: Center(
      child: Text("Edit",
      style: TextStyle(fontSize: 22,
      fontWeight: FontWeight.w900,
      color: Colors.white,
      ),
      ),
    ),
    );
  }

}
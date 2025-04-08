import 'package:flutter/material.dart';

class PersonalInfo_text extends StatelessWidget{
  const PersonalInfo_text({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Personal Info",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        ),
      ],
    );
  }
}

class PersonalInfo extends StatefulWidget{
  const PersonalInfo({super.key});

  @override
  _PersonalInfoState createState()=> _PersonalInfoState();  
}

class _PersonalInfoState extends State<PersonalInfo>{
  bool enable=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width*0.9,
      height:MediaQuery.of(context).size.height*0.15,
      decoration:BoxDecoration(
        border: Border.all(color: const Color.fromARGB(15, 0, 0, 0),width:1.5),
        borderRadius: BorderRadius.circular(13),
        color: Colors.white54,
          ),
        padding: EdgeInsets.symmetric(vertical: 18,horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your name",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  ),
                ),
                
              ]
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Location",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  ),
                ),
              ]
            )
          ],
        ),
      );
  } 
  
}
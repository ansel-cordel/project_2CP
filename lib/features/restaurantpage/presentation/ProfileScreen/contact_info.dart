import 'package:flutter/material.dart';

class ContactInfo_text extends StatelessWidget{
  const ContactInfo_text({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Contact Info",
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width*0.045,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        ),
      ],
    );
  }
}

class ContactInfo extends StatefulWidget{
  const ContactInfo({super.key});

  @override
  _ContactInfoState createState()=> _ContactInfoState();  
}

class _ContactInfoState extends State<ContactInfo>{
  bool enable=true;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width:MediaQuery.of(context).size.width*0.9,
        height:MediaQuery.of(context).size.height*0.17,
        decoration:BoxDecoration(
          border: Border.all(color: const Color.fromARGB(15, 0, 0, 0),width:MediaQuery.of(context).size.width*0.0025),
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.017),
          color: Colors.white54,
            ),
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width*0.02,
            horizontal: MediaQuery.of(context).size.width*0.03
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Location",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: MediaQuery.of(context).size.width*0.035,
                    ),
                  ),
                ]
              ),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Working hours",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: MediaQuery.of(context).size.width*0.035,
                    ),
                  ),
                ]
              ),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Edit Password",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: MediaQuery.of(context).size.width*0.035,
                    ),
                  ),
      
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.edit,
                      size: MediaQuery.of(context).size.width*0.045,
                    ),
                  )
                ]
              ),
            ],
          ),
        ),
    );
  } 
  
}
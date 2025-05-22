import 'package:flutter/material.dart';

class ContactInfo_text extends StatelessWidget {
  const ContactInfo_text({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Contact Info",
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

class ContactInfo extends StatefulWidget {
  final String phonenumber;
  const ContactInfo({super.key,required this.phonenumber});

  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        border:
            Border.all(color: const Color.fromARGB(15, 0, 0, 0), width: 1.5),
        borderRadius: BorderRadius.circular(13),
        color: Colors.white54,
      ),
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              " Phone number",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
            Text(
              widget.phonenumber,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              " Edit password",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

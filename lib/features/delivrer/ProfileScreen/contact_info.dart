import 'package:flutter/material.dart';
 // your provider import

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
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: Colors.brown.shade800,
            shadows: [
              Shadow(
                color: Colors.orange.shade100.withOpacity(0.6),
                offset: const Offset(1, 1),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContactInfo extends StatefulWidget {
  final bool isEditing;
  const ContactInfo({super.key, required this.isEditing});

  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  late TextEditingController phoneController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController(text: "123-456-7890");
    emailController = TextEditingController(text: "email@example.com");
  }

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.orange.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.orange.shade300, width: 1.8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.deepOrange.shade400, width: 2),
      ),
      hintText: hint,
      hintStyle: TextStyle(color: Colors.orange.shade300),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
    );
  }

  TextStyle _textStyle() => TextStyle(
        fontSize: 16,
        color: Colors.brown.shade800,
        fontWeight: FontWeight.w600,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.shade200.withOpacity(0.4),
            offset: const Offset(3, 5),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
        border: Border.all(color: Colors.orange.shade300, width: 1.5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text("Phone number: ", style: _textStyle()),
              Expanded(
                child: widget.isEditing
                    ? TextField(
                        controller: phoneController,
                        decoration: _inputDecoration("Enter phone number"),
                        keyboardType: TextInputType.phone,
                      )
                    : Text(
                        phoneController.text,
                        style: _textStyle(),
                      ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Text("Email: ", style: _textStyle()),
              Expanded(
                child: widget.isEditing
                    ? TextField(
                        controller: emailController,
                        decoration: _inputDecoration("Enter email"),
                        keyboardType: TextInputType.emailAddress,
                      )
                    : Text(
                        emailController.text,
                        style: _textStyle(),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

